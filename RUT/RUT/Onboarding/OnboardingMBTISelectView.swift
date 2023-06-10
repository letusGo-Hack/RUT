//
//  OnboardingMBTISelectView.swift
//  RUT
//
//  Created by Dayuen Seong on 2023/06/10.
//

import SwiftUI

struct OnboardingMBTISelectView: View {
    @State var first: MBTIItemType?
    @State var second: MBTIItemType?
    @State var third: MBTIItemType?
    @State var forth: MBTIItemType?
    
    var selectedItem:
    
    var body: some View {
        HStack {
            VStack {
                OnboardingMBTISelectItemView(type: .E, isSelected: false)
                OnboardingMBTISelectItemView(type: .I, isSelected: false)
            }
            VStack {
                OnboardingMBTISelectItemView(type: .N, isSelected: false)
                OnboardingMBTISelectItemView(type: .S, isSelected: false)
            }
            VStack {
                OnboardingMBTISelectItemView(type: .T, isSelected: false)
                OnboardingMBTISelectItemView(type: .F, isSelected: false)
            }
            VStack {
                OnboardingMBTISelectItemView(type: .P, isSelected: false)
                OnboardingMBTISelectItemView(type: .J, isSelected: false)
            }
        }
    }
}

#Preview {
    OnboardingMBTISelectView()
}
