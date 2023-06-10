//
//  ListItemView.swift
//  RUT
//
//  Created by 강민혜 on 6/10/23.
//

import SwiftUI

struct ListItemView: View, Identifiable {
    var id = UUID()
    
    let mbti: String
    let nickName: String
    let description: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.greenLight)
            VStack(alignment: .leading) {
                Text(mbti)
                    .foregroundColor(.black)
                    .font(.title)
                Text(nickName)
                    .foregroundColor(.black)
                    .font(.title2)
                Text(description)
                    .foregroundColor(.black)
                    .font(.title2)
            }
            .padding(16)
        }
        .padding(16)
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(mbti: "ENTJ", nickName: "이엔티제잉", description: "야야ㅑ야ㅑ야야야ㅑㅑㅇ")
    }
}
