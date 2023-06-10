//
//  CatalogItemView.swift
//  RUT
//
//  Created by 강민혜 on 6/10/23.
//

import SwiftUI

struct CatalogItemView: View, Identifiable {
    var id = UUID()

    let mbti: MBTIType
    let isSelected: Bool
    
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(isSelected ? mbti.backgroundColor : .grayLight)
            VStack(alignment: .leading) {
                Text(mbti.rawValue)
                    .foregroundColor(isSelected ? .black : .white)
                    .font(.system(.body, design: .none, weight: .bold))
            }
            .frame(width: 70, height: 70)
        }
    }
}
