//
//  MainView.swift
//  RUT
//
//  Created by 강민혜 on 6/10/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var sharePlayModel: SharePlayModel
    
    var body: some View {
        NavigationStack {
            bodyView
                .navigationBarTitle("지갑")
        }
    }
    
    private var bodyView: some View {
        VStack {
            profileList
            
            if sharePlayModel.sharePlayState == .groupActivityNeeded {
                shareButton
            }
        }
    }
    
    private var profileList: some View {
        ScrollView {
            LazyVStack {
                ForEach(sharePlayModel.profiles) { profile in
                    ListItemView(profile: profile)
                }
            }
        }
    }
    
    private var shareButton: some View {
        Button { sharePlayModel.startSharing() } label: {
            Text("공유하기")
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
                .background(.blueLight)
                .foregroundColor(.black)
                .cornerRadius(24)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
        }
    }
}
