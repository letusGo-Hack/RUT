//
//  OnboardingContentView.swift
//  RUT
//
//  Created by Dayuen Seong on 2023/06/10.
//

import SwiftUI

struct OnboardingContentView: View {
    var body: some View {
        ZStack {
            VStack {
                Image(.icCancel)
                    .frame(width: 52, height: 52, alignment: .topLeading)
                    
                Text("공유할 MBTI를 설정해주세요!")
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 22, weight: .bold))
                    .padding(.init(top: 60, leading: 0, bottom: 60, trailing: 0))
                OnboardingMBTIView()
            }
        }
        .padding()
        .background(.gray)
    }
}

#Preview {
    OnboardingContentView()
}
