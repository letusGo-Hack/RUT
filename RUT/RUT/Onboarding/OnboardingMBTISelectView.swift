//
//  OnboardingMBTISelectView.swift
//  RUT
//
//  Created by Dayuen Seong on 2023/06/10.
//

import SwiftUI

struct OnboardingMBTISelectView: View {
    @Binding var first: MBTIItemType?
    @Binding var second: MBTIItemType?
    @Binding var third: MBTIItemType?
    @Binding var forth: MBTIItemType?
    
    var body: some View {
        HStack {
            VStack {
                OnboardingMBTISelectItemView(type: .E, isSelectedType: $first)
                OnboardingMBTISelectItemView(type: .I, isSelectedType: $first)
            }
            VStack {
                OnboardingMBTISelectItemView(type: .N, isSelectedType: $second)
                OnboardingMBTISelectItemView(type: .S, isSelectedType: $second)
            }
            VStack {
                OnboardingMBTISelectItemView(type: .T, isSelectedType: $third)
                OnboardingMBTISelectItemView(type: .F, isSelectedType: $third)
            }
            VStack {
                OnboardingMBTISelectItemView(type: .J, isSelectedType: $forth)
                OnboardingMBTISelectItemView(type: .P, isSelectedType: $forth)
            }
        }
        .padding(.init(top: 20, leading: 0, bottom: 20, trailing: 0))
    }
}
