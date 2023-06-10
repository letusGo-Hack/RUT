//
//  MBTIViewModel.swift
//  RUT
//
//  Created by 한상진 on 2023/06/10.
//

import OSLog
import Combine
import Foundation
import GroupActivities
import IdentifiedCollections
import SwiftData
import SwiftUI

enum SharePlayState {
    case groupActivityConnected // 페탐 o, 그액 o
    case groupActivityNeeded // 페탐 켜졌지만, 공유하기 x라 그룹액티비티가 안켜진 상태
    case faceTimeNeeded // 페탐 안켜진 상태 앱 동작 못함
}

@MainActor
final class SharePlayModel: ObservableObject {
    
    private var modelContext: ModelContext?
    
    @Published var profiles: IdentifiedArrayOf<Profile> = []
    
    var sharePlayState: SharePlayState {
        switch (groupSession, groupStateObserver.isEligibleForGroupSession) {
        case (.some, true): return .groupActivityConnected
        case (.none, true): return .groupActivityNeeded
        case (.some, false): return .faceTimeNeeded
        case (.none, false): return .faceTimeNeeded
        }
    }
    
    var groupSession: GroupSession<MBTITogether>?
    var messenger: GroupSessionMessenger?
    var journal: GroupSessionJournal?
    
    private var subscriptions: Set<AnyCancellable> = []
    private var tasks = Set<Task<Void, Never>>()
    
    let groupStateObserver = GroupStateObserver()
    
    func onAppear(modelContext: ModelContext) {
        self.modelContext = modelContext
        loadProfilesFromDB()
    }
    
    func startSharing() {
        Task {
            let activity = MBTITogether()
            
            switch await activity.prepareForActivation() {
            case .activationDisabled:
                break
            case .activationPreferred:
                do {
                    _ = try await activity.activate()
                } catch {
                    Logger().error("activationPreferred error: \(error)")
                }
            case .cancelled:
                break
            @unknown default:
                fatalError()
            }
        }
    }
    
    func configureGroupSession(_ groupSession: GroupSession<MBTITogether>) {
        self.groupSession = groupSession
        let messenger = GroupSessionMessenger(session: groupSession)
        self.messenger = messenger
//        let journal = GroupSessionJournal(session: groupSession)
//        self.journal = journal
        
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
            .sink { [weak self] activeParticipants in
                let newParticipants = activeParticipants.subtracting(groupSession.activeParticipants)
                self?.send(profile: .mock, to: newParticipants)
            }
            .store(in: &subscriptions)
        
        // 받기
        let receiveTask = Task {
            for await (profile, _) in messenger.messages(of: Profile.self) {
                handle(profile)
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
    
    private func send(profile: Profile, to newParticipants: Set<Participant>) {
        Task {
            do {
                try await messenger?.send(profile, to: .only(newParticipants))
            } catch {
                Logger().error("activeParticipants error: \(error)")
            }
        }
    }
    
    func handle(_ profile: Profile) {
        guard let modelContext else { return }

        modelContext.insert(profile)
        
        do {
            try modelContext.save()
            profiles.append(profile)
        } catch {
            Logger().error("error: \(error)")
        }
    }
    
    private func reset() {
        loadProfilesFromDB()
        messenger = nil
        journal = nil
        tasks.forEach { $0.cancel() }
        tasks = []
        subscriptions = []
    }
    
    private func loadProfilesFromDB() {
        guard let modelContext else { return }
        
        let descriptor = FetchDescriptor<Profile>()
        
        do {
            let fetchedProfiles = try modelContext.fetch(descriptor)
            profiles = .init(uniqueElements: fetchedProfiles)
        } catch {
            Logger().error("error: \(error)")
        }
    }
}
