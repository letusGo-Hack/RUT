//
//  MBTITogether.swift
//  RUT
//
//  Created by Ernest Hong on 2023/06/10.
//

import SwiftUI
import Combine
import GroupActivities
import Observation

struct MBTITogether: GroupActivity {
    
    static var activityIdentifier: String = "com.letus.RUT.MBTITogether"
    
    var metadata: GroupActivityMetadata {
        var metadata = GroupActivityMetadata()
        metadata.title = NSLocalizedString("Draw Together", comment: "Title of group activity")
        metadata.type = .generic
        return metadata
    }
}

@Observable
class MBTIViewModel {
    var profiles: Set<Profile> = [
        Profile(id: UUID(), nickname: "my nickname", description: "description", mbti: "mock")
    ]
    var groupSession: GroupSession<MBTITogether>? = nil
    var messenger: GroupSessionMessenger? = nil
    var journal: GroupSessionJournal? = nil
    
    private var subscriptions: Set<AnyCancellable> = []
    private var tasks = Set<Task<Void, Never>>()
    
    private let profile = Profile(id: UUID(), nickname: "my nickname", description: "description", mbti: "MBTI")
    
    func startSharing() {
        Task {
            do {
                _ = try await MBTITogether().activate()
            } catch {
                print("start error \(error)")
            }
        }
    }
    
    func configureGroupSession(_ groupSession: GroupSession<MBTITogether>) {
        self.groupSession = groupSession
        let messenger = GroupSessionMessenger(session: groupSession)
        self.messenger = messenger
        let journal = GroupSessionJournal(session: groupSession)
        self.journal = journal
        
        groupSession.$state
            .sink { state in
                if case .invalidated = state {
                    self.groupSession = nil
                    self.reset()
                }
            }
            .store(in: &subscriptions)
        
        // 보내기
        groupSession.$activeParticipants
            .sink { activeParticipants in
//                let newParticipants = activeParticipants.subtracting(groupSession.activeParticipants)

                Task {
                    try? await messenger.send(self.profile, to: .all)
                }
            }
            .store(in: &subscriptions)
        
        // 받기
        tasks.insert(
            Task {
                for await (message, _) in messenger.messages(of: Profile.self) {
                    handle(message)
                }
            }
        )
        
//        tasks.insert(
//            Task {
//                for await images in journal.attachments {
//                    await handle(images)
//                }
//            }
//        )

        groupSession.join()
    }
    
    func handle(_ profile: Profile) {
        profiles.insert(profile)
    }
    
    private func reset() {
        profiles = []
        
        messenger = nil
        journal = nil
        tasks.forEach { $0.cancel() }
        tasks = []
        subscriptions = []
        
        if groupSession != nil {
            groupSession?.leave()
            groupSession = nil
            self.startSharing()
        }
    }
}
