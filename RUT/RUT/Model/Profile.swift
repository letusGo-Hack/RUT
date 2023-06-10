//
//  Profile.swift
//  RUT
//
//  Created by 한상진 on 2023/06/10.
//

import Foundation

struct Profile: Codable, Identifiable, Hashable {
    let id: UUID
    let nickname: String
    let description: String
    let mbti: MBTIType
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Profile {
    static var mock: Self = .init(
        id: UUID(),
        nickname: "mock",
        description: "this is mock",
        mbti: .allCases.randomElement()!
    )
}
