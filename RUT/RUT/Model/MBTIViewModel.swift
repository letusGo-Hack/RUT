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

@MainActor
final class SharePlayModel: ObservableObject {
    @Published var profiles: IdentifiedArrayOf<Profile> = .init()
    var isSessionValid: Bool {
        return groupSession == nil && groupStateObserver.isEligibleForGroupSession
    }
    
    var groupSession: GroupSession<MBTITogether>?
    var messenger: GroupSessionMessenger?
    var journal: GroupSessionJournal?
    
    private var subscriptions: Set<AnyCancellable> = []
    private var tasks = Set<Task<Void, Never>>()
    
    let groupStateObserver = GroupStateObserver()
    
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
        profiles.append(profile)
    }
    
    private func reset() {
        profiles = []
        
        messenger = nil
        journal = nil
        tasks.forEach { $0.cancel() }
        tasks = []
        subscriptions = []
    }
}
