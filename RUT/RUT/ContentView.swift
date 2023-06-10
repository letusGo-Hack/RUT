//
//  ContentView.swift
//  RUT
//
//  Created by 한상진 on 2023/06/10.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject var sharePlayModel = SharePlayModel()
    
    var body: some View {
        TabView {
            MainView(sharePlayModel: sharePlayModel)
                .tabItem {
                    Image(systemName: "house")
                    Text("Main")
                }
            
            OnboardingContentView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Setting")
                }
            
            #if DEBUG
            DebugView(sharePlayModel: sharePlayModel)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Debug")
                }
            #endif
        }
        .task {
            for await session in MBTITogether.sessions() {
                print("session: \(session)")
                sharePlayModel.configureGroupSession(session)
            }
        }
    }
}

struct DebugView: View {
    @ObservedObject var sharePlayModel: SharePlayModel
    
    var body: some View {
        VStack {
            List(Array(sharePlayModel.profiles)) { profile in
                HStack {
                    Text(profile.nickname)
                    Text(profile.mbti.rawValue)
                }
            }
            
            if sharePlayModel.sharePlayState == .groupActivityNeeded {
                Button {
                    sharePlayModel.startSharing()
                } label: {
                    Text("공유하기")
                }
            } else {
                // TODO: facetime을 연결해라
            }
        }
    }
}

#Preview {
    ContentView()
}

