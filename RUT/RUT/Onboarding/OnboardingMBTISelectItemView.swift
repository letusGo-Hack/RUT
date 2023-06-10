//
//  OnboardingMBTISelectItemView.swift
//  RUT
//
//  Created by Dayuen Seong on 2023/06/10.
//

import SwiftUI

struct OnboardingMBTISelectItemView: View {
    let type: MBTIItemType
    @Binding var isSelectedType: MBTIItemType?
    
    var body: some View {
        Button(type.rawValue, action: {
            self.isSelectedType = type
        })
        .font(.system(size: 40))
        .foregroundStyle(isSelectedType == type ? .black : .grayDark)
        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        .frame(width: 70, height: 70)
        .background(isSelectedType == type ? type.backgroundColor : .grayLight)
        .clipShape(.rect(cornerRadius: 20))
    }
}
