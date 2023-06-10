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
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Image(.icCancel)
                    .frame(width: 52, height: 52, alignment: .topLeading)
                Spacer()
            }
            VStack {
                Text("닉네임 (이름)")
                    .lineLimit(2)
                    .foregroundStyle(.grayLight)
                    .font(.system(size: 22, weight: .bold))
                    .padding(.init(top: 60, leading: 0, bottom: 30, trailing: 0))
                
                TextField("닉네임을 입력해주세요.", text: $nickName)
                    .textFieldStyle(.roundedBorder)
                    .background(.clear)
                    .foregroundStyle(.black)
                    .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                
                VStack {
                    Text("")
                }
                .frame(maxWidth: geometry.size.width - 80, minHeight: 2, maxHeight: 2)
                .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                .background(.grayLight)
                
                Text("나에 대한 한마디")
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.grayLight)
                    .font(.system(size: 22, weight: .bold))
                    .padding(.init(top: 60, leading: 0, bottom: 20, trailing: 0))
                
                TextEditor(text: $profile)
                    .padding()
                    .foregroundStyle(.black)
                    .font(.system(size: 18))
                    .lineSpacing(3)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                    .border(.blackDark, width: 1.5)
                
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

#if DEBUG
struct OnboardingProfileContentView_Preview: PreviewProvider {
    @State static var testProfile: String = "테스트"
    
    static var previews: some View {
        OnboardingProfileContentView(profile: testProfile)
    }
}
#endif
