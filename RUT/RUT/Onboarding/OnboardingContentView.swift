//
//  OnboardingContentView.swift
//  RUT
//
//  Created by Dayuen Seong on 2023/06/10.
//

import SwiftUI
import SwiftData

struct OnboardingContentView: View {
    @AppStorage("MyMBTI") var myMBTI: MBTIType?
    
    @State var mbtiTypeList: [MBTIItemType?] = []
    @State var first: MBTIItemType?
    @State var second: MBTIItemType?
    @State var third: MBTIItemType?
    @State var forth: MBTIItemType?
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image(.icCancel)
                        .frame(width: 52, height: 52, alignment: .topLeading)
                    Spacer()
                }
                VStack {
                    Text("공유할 MBTI를 설정해주세요!")
                        .lineLimit(2)
                        .foregroundStyle(.grayLight)
                        .font(.system(size: 22, weight: .bold))
                        .padding(.init(top: 60, leading: 0, bottom: 0, trailing: 0))
                    
                    OnboardingMBTIView(
                        first: $first,
                        second: $second,
                        third: $third,
                        forth: $forth
                    )
                    .padding(.init(top: 60, leading: 20, bottom: 20, trailing: 20))
                    
                    VStack {
                        Text("")
                            .frame(maxWidth: .infinity)
                            .frame(height: 2)
                            .padding(.horizontal, 20)
                    }
                    .background(.grayLight)
                    .padding(.horizontal, 20)
                    
                    OnboardingMBTISelectView(
                        first: $first,
                        second: $second,
                        third: $third,
                        forth: $forth
                    )
                    .padding(.horizontal, 20)
                    
                    Link("내 MBTI를 모르겠어요.", destination: URL(string: "https://www.16personalities.com/ko/%EB%AC%B4%EB%A3%8C-%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95-%EA%B2%80%EC%82%AC")!)
                    .foregroundStyle(.grayLight)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.init(top: 40, leading: 20, bottom: 40, trailing: 20))
                    
                    Spacer()
                    
                    // TODO: 완료 버튼 이벤트 달기
                    Button {
                        let mbtiString = [first, second, third, forth].compactMap(\.?.rawValue).joined()
                        let mbti: MBTIType = .init(rawValue: mbtiString)!
                        myMBTI = mbti
                    } label: {
                        Text("완료")
                            .font(.system(size: 22,
                                          weight: .bold))
                            .foregroundStyle(.black)
                            .frame(width: 363,
                                   height: 70)
                    }
                    .background(.blueLight)
                    .clipShape(.rect(cornerRadius: 15))
                    .padding(.init(top: 30, leading: 20, bottom: 20, trailing: 20))
                }
            }
            .background(.blackDark)
        }
    }
}

#Preview {
    OnboardingContentView(mbtiTypeList: [])
}
