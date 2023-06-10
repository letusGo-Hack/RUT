//
//  OnboardingContentView.swift
//  RUT
//
//  Created by Dayuen Seong on 2023/06/10.
//

import SwiftUI

struct OnboardingContentView: View {
    @State var mbtiTypeList: [MBTIItemType?] = []
    @State var first: MBTIItemType?
    @State var second: MBTIItemType?
    @State var third: MBTIItemType?
    @State var forth: MBTIItemType?
    
    var body: some View {
        ZStack {
            VStack {
                Image(.icCancel)
                    .frame(width: 52, height: 52, alignment: .topLeading)
                Text("공유할 MBTI를 설정해주세요!")
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 22, weight: .bold))
                    .padding(.init(top: 60, leading: 0, bottom: 60, trailing: 0))
                OnboardingMBTIView(
                    first: $first,
                    second: $second,
                    third: $third,
                    forth: $forth
                )
                OnboardingMBTISelectView(
                    first: $first,
                    second: $second,
                    third: $third,
                    forth: $forth
                )
            }
        }
        .padding()
        .background(.gray)
    }
}

#Preview {
    OnboardingContentView(mbtiTypeList: [])
}
