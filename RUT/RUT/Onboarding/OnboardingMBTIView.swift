//
//  OnboardingMBTIView.swift
//  RUT
//
//  Created by Dayuen Seong on 2023/06/10.
//

import SwiftUI

struct OnboardingMBTIView: View {
    var body: some View {
        HStack(spacing: 50) {
            Spacer(minLength: 5)
            Text("E")
                .font(.system(size: 40))
                .foregroundStyle(.black)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("N")
                .font(.system(size: 40))
                .foregroundStyle(.black)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("T")
                .font(.system(size: 40))
                .foregroundStyle(.black)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("J")
                .font(.system(size: 40))
                .foregroundStyle(.black)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Spacer(minLength: 5)
        }
        .background(.grayLight)
    }
}

#Preview {
    OnboardingMBTIView()
}
