//
//  OnboardingMBTISelectItemView.swift
//  RUT
//
//  Created by Dayuen Seong on 2023/06/10.
//

import SwiftUI

struct OnboardingMBTISelectItemView: View {
    private var type: MBTIItemType
    @Binding var isSelected: Bool
    
    init(type: MBTIItemType, isSelected: Binding<Bool>) {
        self.type = type
        self._isSelected = isSelected
    }
    
    var body: some View {
        Text(type.rawValue)
            .font(.system(size: 40))
            .foregroundStyle(isSelected ? .black : .grayDark)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .frame(width: 70, height: 70)
            .background(isSelected ? type.backgroundColor : .grayLight)
            .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
//    OnboardingMBTISelectItemView(item: .init(text: "E", selectedTextColor: .brown, selectedBackgroundColor: .skyblue, isSelected: false))
}
