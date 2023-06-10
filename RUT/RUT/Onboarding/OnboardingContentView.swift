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
        GeometryReader { geometry in
            VStack {
                HStack {
                    Image(.icCancel)
                        .frame(width: 52, height: 52, alignment: .topLeading)
                    Spacer()
                }
                VStack {
                    Text("공유할 MBTI를 설정해주세요!")
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.grayLight)
                        .font(.system(size: 22, weight: .bold))
                        .padding(.init(top: 60, leading: 0, bottom: 60, trailing: 0))
                    
                    OnboardingMBTIView(
                        first: $first,
                        second: $second,
                        third: $third,
                        forth: $forth
                    )
                    
                    VStack {
                        Text("")
                    }
                    .frame(maxWidth: geometry.size.width - 80, minHeight: 2, maxHeight: 2)
                    .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .background(.grayLight)
                    
                    OnboardingMBTISelectView(
                        first: $first,
                        second: $second,
                        third: $third,
                        forth: $forth
                    )
                    
                    Button("내 MBTI를 모르겠어요.", action: {
                        
                    })
                    .foregroundStyle(.grayLight)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.init(top: 40, leading: 20, bottom: 40, trailing: 20))
                    
                    Button(action: {
                        
                    }, label: {
                        Text("완료")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundStyle(.black)
                            .frame(width: 363, height: 70)
                    })
                    .background(.blueLight)
                    .clipShape(.rect(cornerRadius: 15))
                    .padding(.init(top: 30, leading: 20, bottom: 20, trailing: 20))
                }
            }
            .background(.blackDark)
        }
    }
}

//#Preview {
//    OnboardingContentView(mbtiTypeList: [])
//}
