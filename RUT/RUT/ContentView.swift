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
    @Query private var items: [Item]
    
    @StateObject var shareViewModel = MBTIViewModel()
    
    let dummyData = [
        ListItemView(mbti: .INFP, nickName: "나는야INFP", description: "하하하하하하하하"),
        ListItemView(mbti: .ESTJ, nickName: "나는야INFP", description: "하하하하하하하하"),
        ListItemView(mbti: .INTJ, nickName: "나는야INFP", description: "하하하하하하하하"),
        ListItemView(mbti: .ENTP, nickName: "나는야INFP", description: "하하하하하하하하"),
        ListItemView(mbti: .ISTJ, nickName: "나는야INFP", description: "하하하하하하하하")
    ]

    // userdefaults에 저장된 전체 사용자 데이터로, 아래 데이터를 생성해야함
    // check - 더미데이터
    let dummySurrounding = [
        CatalogSurroundingView(mbti: .ENTJ, percent: 50),
        CatalogSurroundingView(mbti: .ESTJ, percent: 25),
        CatalogSurroundingView(mbti: .INFP, percent: 25)
    ]
    
    
    
    var body: some View {
        TabView {
            MainView(values: dummyData)
                .tabItem {
                    Image(systemName: "house")
                    Text("Main")
                }
            
            CatalogView(values: dummySurrounding)
                .tabItem {
                    Image(systemName: "star")
                    Text("Catalog")
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
                shareViewModel.configureGroupSession(session)
            }
        }
    }
    
    private var debugView: some View {
        VStack {
            List(Array(shareViewModel.profiles)) { profile in
                HStack {
                    Text(profile.nickname)
                    Text(profile.mbti)
                }
            }
            
            if shareViewModel.groupSession == nil && shareViewModel.groupStateObserver.isEligibleForGroupSession {
                Button(action: {
                    shareViewModel.startSharing()
                }, label: {
                    Text("startSharing")
                })
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

