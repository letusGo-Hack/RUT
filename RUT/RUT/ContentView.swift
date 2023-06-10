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
    
    let dummyData = [
        ListItemView(mbti: .INFP, nickName: "나는야INFP", description: "하하하하하하하하"),
        ListItemView(mbti: .ESTJ, nickName: "나는야INFP", description: "하하하하하하하하"),
        ListItemView(mbti: .INTJ, nickName: "나는야INFP", description: "하하하하하하하하"),
        ListItemView(mbti: .ENTP, nickName: "나는야INFP", description: "하하하하하하하하"),
        ListItemView(mbti: .ISTJ, nickName: "나는야INFP", description: "하하하하하하하하")
    ]
    
    
    var body: some View {
        TabView {
            MainView(values: dummyData)
                .tabItem {
                    Image(systemName: "house")
                    Text("Main")
                }
            
            OnboardingContentView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Setting")
                }
            
            debugView
                .tabItem {
                    Image(systemName: "gear")
                    Text("Debug")
                }
        }
        .task {
            for await session in MBTITogether.sessions() {
                print("session: \(session)")
                sharePlayModel.configureGroupSession(session)
            }
        }
    }
    
    private var debugView: some View {
        VStack {
            List(Array(sharePlayModel.profiles)) { profile in
                HStack {
                    Text(profile.nickname)
                    Text(profile.mbti)
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

