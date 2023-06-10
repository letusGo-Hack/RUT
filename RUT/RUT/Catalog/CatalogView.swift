//
//  CatalogView.swift
//  RUT
//
//  Created by 강민혜 on 6/10/23.
//

import SwiftUI
import SwiftData

struct CatalogView: View {
    @ObservedObject var sharePlayModel: SharePlayModel
    @Environment(\.modelContext) private var modelContext: ModelContext
    
    
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
    
    var body: some View {
        
        NavigationView {
            bodyView
            .navigationBarTitle("도감")
        }
    }
    
    private var bodyView: some View {
        VStack {
            ScrollView {
                
                VStack {
                    gridView
                    surroundingView
                }
            }
        }
    }
    
    private var gridView: some View {
        // 도감 list
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 4), spacing: 16) {
            ForEach(existenceArray) { item in
                CatalogItemView(mbti: item.mbti, isSelected: item.isSelected)
            }
        }
        .padding(10)
    }
    
    private var surroundingView: some View {
        
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

            ForEach(sharePlayModel.profiles) { profile in
                CatalogSurroundingView(profile: profile)
            }
        }
    }
    
}

