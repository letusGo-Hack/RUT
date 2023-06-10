//
//  ProfileView.swift
//  RUT
//
//  Created by 강민혜 on 6/10/23.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    
    @State var lbMBTI: String
    @State var lbNickName: String
    @State var lbDescription: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerSize: 10.0)
                .fill(Color.yellow)
                .frame(height: 100)
            VStack(alignment: .leading) {
                Text(lbMBTI)
                    .foregroundColor(.black)
                    .font(.title)
                Text(lbNickName)
                    .foregroundColor(.black)
                    .font(.title2)
                Text(lbDescription)
                    .foregroundColor(.black)
                    .font(.title2)
            }
            .padding(16)
        }
        .padding()
        
    }
    
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(lbMBTI: "entj", lbNickName: "닉네임이당", lbDescription: "가나다라마바사아자차카타파하")
    }
}
