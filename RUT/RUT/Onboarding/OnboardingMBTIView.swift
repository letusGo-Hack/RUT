//
//  OnboardingMBTIView.swift
//  RUT
//
//  Created by Dayuen Seong on 2023/06/10.
//

import SwiftUI

struct OnboardingMBTIView: View {
    @Binding var first: MBTIItemType?
    @Binding var second: MBTIItemType?
    @Binding var third: MBTIItemType?
    @Binding var forth: MBTIItemType?
    
    private var isComplete: Bool {
        guard let _ = first,
              let _ = second,
              let _ = third,
              let _ = forth else { return false }
        return true
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center, spacing: 30) {
                Spacer(minLength: 5)
                Text(first?.rawValue ?? "")
                    .font(.system(size: 40))
                    .foregroundStyle(.black)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .frame(minHeight: 82, maxHeight: 82)
                Text(second?.rawValue ?? "")
                    .font(.system(size: 40))
                    .foregroundStyle(.black)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(third?.rawValue ?? "")
                    .font(.system(size: 40))
                    .foregroundStyle(.black)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(forth?.rawValue ?? "")
                    .font(.system(size: 40))
                    .foregroundStyle(.black)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer(minLength: 5)
            }
            .background(isComplete ? .blueLight : .grayLight)
            .padding(.init(top: 0, leading: 20, bottom: 20, trailing: 20))
        }
    }
}
