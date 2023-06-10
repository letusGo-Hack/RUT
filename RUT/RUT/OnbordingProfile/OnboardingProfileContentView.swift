//
//  OnboardingProfileContentView.swift
//  RUT
//
//  Created by Dayuen Seong on 2023/06/10.
//

import SwiftUI

struct OnboardingProfileContentView: View {
    @State var first: MBTIItemType?
    @State var second: MBTIItemType?
    @State var third: MBTIItemType?
    @State var forth: MBTIItemType?
    
    @State var nickName: String = ""
    @State var profile: String = ""
    
    // 1. 스크롤뷰
    var body: some View {
        ScrollView {
            HStack {
                Image(.icCancel)
                    .frame(width: 52, height: 52, alignment: .topLeading)
                Spacer()
            }
            VStack {
                Text("닉네임 (이름)")
                    .foregroundStyle(.grayLight)
                    .font(.system(size: 22, weight: .bold))
                    .padding(.init(top: 60, leading: 0, bottom: 30, trailing: 0))
                
                TextField("닉네임을 입력해주세요.", text: $nickName)
                    .lineLimit(1)
                    .background(.clear)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                
                VStack {
                    Text("")
                        .frame(maxWidth: .infinity)
                        .frame(height: 2)
                        .padding(.horizontal, 20)
                }
                .background(.grayLight)
                .padding(.horizontal, 20)
                
                Text("나에 대한 한마디")
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.grayLight)
                    .font(.system(size: 22, weight: .bold))
                    .padding(.init(top: 60, leading: 0, bottom: 20, trailing: 0))
                
                TextField("나는 소심하지만 용감하다!", text: $nickName)
                    .lineLimit(1)
                    .background(.clear)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                
                VStack {
                    Text("")
                        .frame(maxWidth: .infinity)
                        .frame(height: 2)
                        .padding(.horizontal, 20)
                }
                .background(.grayLight)
                .padding(.horizontal, 20)
                
                Spacer(minLength: 250)
                
                // TODO: 완료 버튼 이벤트 달기
                Button(action: {
                    
                }, label: {
                    Text("완료")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 70)
                        .padding(.horizontal, 20)
                })
                .background(.blueLight)
                .clipShape(.rect(cornerRadius: 15))
                .scenePadding()
            }
        }
        .background(.blackDark)
    }
}

#if DEBUG
struct OnboardingProfileContentView_Preview: PreviewProvider {
    @State static var testProfile: String = "테스트"
    
    static var previews: some View {
        OnboardingProfileContentView(profile: testProfile)
    }
}
#endif
