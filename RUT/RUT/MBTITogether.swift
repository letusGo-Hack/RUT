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
import IdentifiedCollections

struct MBTITogether: GroupActivity {
    
    static var activityIdentifier: String = "com.letus.RUT.MBTITogether"
    
    var metadata: GroupActivityMetadata {
        var metadata = GroupActivityMetadata()
        metadata.title = NSLocalizedString("Draw Together", comment: "Title of group activity")
        metadata.type = .generic
        return metadata
    }
}

@MainActor
class MBTIViewModel: ObservableObject {
    @Published var profiles: [Profile] = [
        Profile(id: UUID(), nickname: "my nickname", description: "description", mbti: "mock")
    ]
    var groupSession: GroupSession<MBTITogether>? = nil
    var messenger: GroupSessionMessenger? = nil
    var journal: GroupSessionJournal? = nil
    
    private var subscriptions: Set<AnyCancellable> = []
    private var tasks = Set<Task<Void, Never>>()
    
    let groupStateObserver = GroupStateObserver()
    
    func startSharing() {
        Task {
            let activity = MBTITogether()
            
            switch await activity.prepareForActivation() {
            case .activationDisabled:
                print(#function, "activationDisabled")
                break
            case .activationPreferred:
                print(#function, "activationPreferred")
                do {
                    print(#function, #line)
                    _ = try await activity.activate()
                    print(#function, #line)
                } catch {
                    print(#function, "error \(error)")
                }
            case .cancelled:
                print(#function, "cancelled")
                break
            default:
                print(#function, "default")
            }
        }
    }
    
    func configureGroupSession(_ groupSession: GroupSession<MBTITogether>) {
        print(#function)

        self.groupSession = groupSession
        let messenger = GroupSessionMessenger(session: groupSession)
        self.messenger = messenger
//        let journal = GroupSessionJournal(session: groupSession)
//        self.journal = journal
        
        groupSession.$state
            .sink { state in
                if case .invalidated = state {
                    self.groupSession = nil
                    print("session invalidated")
                    self.reset()
                }
            }
            .store(in: &subscriptions)
        
        // 보내기
        groupSession.$activeParticipants
            .sink { activeParticipants in
                let newParticipants = activeParticipants.subtracting(groupSession.activeParticipants)

                Task {
                    do {
                        print(
                            "activeParticipants"
                        )
                        try await messenger.send(
                            Profile(
                                id: UUID(),
                                nickname: "my nickname",
                                description: "description",
                                mbti: MBTIType.allCases.randomElement()?.rawValue ?? ""
                            ),
                            to: .only(newParticipants)
                        )
                    } catch {
                        print("activeParticipants error: \(error)")
                    }
                }
            }
            .store(in: &subscriptions)
        
        // 받기
        let receiveTask = Task {
            print("receive")
            for await (message, _) in messenger.messages(of: Profile.self) {
                print("receive message: \(message)")
                handle(message)
            }
        }
        
        tasks.insert(receiveTask)
        
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
        print("handle: \(profile)")
        profiles.append(profile)
    }
    
    private func reset() {
        print(#function)
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
