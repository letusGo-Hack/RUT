//
//  ListItemView.swift
//  RUT
//
//  Created by 강민혜 on 6/10/23.
//

import SwiftUI

struct ListItemView: View, Identifiable {
    var id = UUID()

    let mbti: MBTIType
    let nickName: String
    let description: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(mbti.backgroundColor)
            VStack(alignment: .leading) {
                Text(mbti.rawValue)
                    .foregroundColor(.black)
                    .font(.system(.title, design: .none, weight: .bold))
                Spacer(minLength: 10)
                Text(nickName)
                    .foregroundColor(.black)
                    .font(.title3)
                Spacer(minLength: 10)
                Text(description)
                    .foregroundColor(.black)
                    .font(.body)
            }
            .padding(16)
        }
        .padding(.horizontal, 16)
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(mbti: .ENTJ, nickName: "이엔티제잉", description: "야야ㅑ야ㅑ야야야ㅑㅑㅇ")
    }
}
