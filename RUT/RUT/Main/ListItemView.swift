//
//  ListItemView.swift
//  RUT
//
//  Created by 강민혜 on 6/10/23.
//

import SwiftUI

struct ListItemView: View {
    let profile: Profile
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 24)
                .foregroundColor(profile.mbti.backgroundColor)
            VStack(alignment: .leading) {
                Text(profile.mbti.rawValue)
                    .foregroundColor(.black)
                    .font(.system(.title, design: .none, weight: .bold))
                Spacer(minLength: 10)
                Text(profile.nickname)
                    .foregroundColor(.black)
                    .font(.title3)
                Spacer(minLength: 10)
                Text(profile.profileDescription)
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
        ListItemView(profile: .mock)
    }
}
