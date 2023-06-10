//
//  CatalogView.swift
//  RUT
//
//  Created by 강민혜 on 6/10/23.
//

import SwiftUI

struct CatalogView: View {
    
    // check - 더미데이터
    var existenceArray = [
        CatalogItemView(mbti: .ISFJ, isSelected: false),
        CatalogItemView(mbti: .ISTJ, isSelected: false),
        CatalogItemView(mbti: .INFP, isSelected: true),
        CatalogItemView(mbti: .ISFP, isSelected: false),
        
        CatalogItemView(mbti: .ESFJ, isSelected: false),
        CatalogItemView(mbti: .ESTJ, isSelected: false),
        CatalogItemView(mbti: .ENFP, isSelected: false),
        CatalogItemView(mbti: .ESFP, isSelected: true),
        
        CatalogItemView(mbti: .INFJ, isSelected: false),
        CatalogItemView(mbti: .INTJ, isSelected: false),
        CatalogItemView(mbti: .INTP, isSelected: false),
        CatalogItemView(mbti: .ISTP, isSelected: false),
        
        CatalogItemView(mbti: .INFJ, isSelected: false),
        CatalogItemView(mbti: .ENTJ, isSelected: false),
        CatalogItemView(mbti: .ENTP, isSelected: false),
        CatalogItemView(mbti: .ESTP, isSelected: false)
    ]
    
    let values: [CatalogSurroundingView]
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                VStack {
                    
                    // 도감 list
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 4), spacing: 16) {
                        ForEach(existenceArray) { item in
                            CatalogItemView(mbti: item.mbti, isSelected: item.isSelected)
                        }
                    }
                    .padding(10)
   
                    // 내주변 MBTI
                    LazyVStack() {
                        
                        ZStack(alignment: .leading) {
                            VStack(alignment: .leading) {
                                
                                Text("내 주변 MBTI")
                                    .font(.system(.title, design: .none, weight: .bold))
                                    .background(.clear)
                                    .foregroundColor(.grayDark)
                                    .padding(.vertical, 16)
                                    .padding(.leading, 16)
                            }
                        }

                        ForEach(values) { item in
                            CatalogSurroundingView(mbti: item.mbti, percent: item.percent)
                        }
                    }
                    
                }
            }
            .navigationBarTitle("도감")
            
        }
    }
    
}
