//
//  OnboardingMBTIView.swift
//  RUT
//
//  Created by Dayuen Seong on 2023/06/10.
//

import SwiftUI

struct OnboardingMBTIView: View {
    @Binding var first: MBTIItemType?
    @Binding var second: MBTIItemType?
    @Binding var third: MBTIItemType?
    @Binding var forth: MBTIItemType?
    
    var body: some View {
        HStack(spacing: 50) {
            Spacer(minLength: 5)
            Text(first?.rawValue ?? "")
                .font(.system(size: 40))
                .foregroundStyle(.black)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text(second?.rawValue ?? "")
                .font(.system(size: 40))
                .foregroundStyle(.black)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text(third?.rawValue ?? "")
                .font(.system(size: 40))
                .foregroundStyle(.black)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text(forth?.rawValue ?? "")
                .font(.system(size: 40))
                .foregroundStyle(.black)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Spacer(minLength: 5)
        }
        .background(.grayLight)
    }
}
