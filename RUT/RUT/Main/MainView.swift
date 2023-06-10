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
                
                // 공유하기 버튼
                Button(action: {
                    print("공유하기 버튼 클릭!!")
                }) {
                    Text("공유하기")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .padding(.horizontal, 16)
                        .background(.blueLight)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                }
                
                // 리스트뷰
                ScrollView {
                    LazyVStack() {
                        ForEach(values) { item in
                            ListItemView(mbti: item.mbti, nickName: item.nickName, description: item.description)
                        }
                    }
                }

            }
            .navigationBarTitle("지갑")
            
            
        }
    }
    
}
