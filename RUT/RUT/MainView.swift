//
//  MainView.swift
//  RUT
//
//  Created by 강민혜 on 6/10/23.
//

import SwiftUI

struct MainView: View {
    
    let values: [ListItemView]
    
    var body: some View {
        NavigationView {

            VStack {
                // 리스트뷰
                ScrollView {
                    LazyVStack() {
                        ForEach(values) { item in
                            ListItemView(mbti: item.mbti, nickName: item.nickName, description: item.description)
                        }
                    }
                }
                
                // 공유하기 버튼
                Button("공유하기") {
                    print("공유하기 버튼 클릭!!")
                }
                .padding(16)
            }
            .navigationBarTitle("지갑")
            
            
        }
    }
    
}
