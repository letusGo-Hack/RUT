//
//  CatalogSurroundingView.swift
//  RUT
//
//  Created by 강민혜 on 6/10/23.
//

import SwiftUI

struct CatalogSurroundingView: View, Identifiable {
    var id = UUID()

    let mbti: MBTIType
    let percent: Int
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.grayLight)
            
            HStack(alignment: .center, spacing: 0) {
                Text(mbti.rawValue)
                    .foregroundColor(.black)
                    .font(.system(.title3, design: .none, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Text("\(percent) %")
                    .foregroundColor(.black)
                    .font(.system(.title3, design: .none, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 50)
        .padding(.horizontal, 20)
    }
}

