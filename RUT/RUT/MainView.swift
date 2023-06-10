//
//  MainView.swift
//  RUT
//
//  Created by 강민혜 on 6/10/23.
//

import SwiftUI

struct MainView: View {
    
    var dummyData: [ListItemView] = [
        ListItemView(mbti: "INFP", nickName: "나는야INFP", description: "하하하하하하하하"),
        ListItemView(mbti: "INFP", nickName: "나는야INFP", description: "하하하하하하하하"),
        ListItemView(mbti: "INFP", nickName: "나는야INFP", description: "하하하하하하하하"),
        ListItemView(mbti: "INFP", nickName: "나는야INFP", description: "하하하하하하하하"),
        ListItemView(mbti: "INFP", nickName: "나는야INFP", description: "하하하하하하하하")
    ]
    
    var body: some View {
        
        // 리스트뷰
        ZStack(alignment: .top) {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(dummyData) { item in
                        ListItemView(mbti: item.mbti, nickName: item.nickName, description: item.description)
                    }
                }
            }
        }
        
        // 공유하기 버튼
        
        
    }
    
}
