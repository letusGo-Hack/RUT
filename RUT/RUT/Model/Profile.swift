//
//  Profile.swift
//  RUT
//
//  Created by 한상진 on 2023/06/10.
//

import SwiftData
import Foundation

@Model
final class Profile: Identifiable, Hashable, Codable {
    let id: UUID
    let nickname: String
    let description: String
    let mbti: MBTIType
    
    init(
        id: UUID,
        nickname: String,
        description: String,
        mbti: MBTIType
    ) {
        self.id = id
        self.nickname = nickname
        self.description = description
        self.mbti = mbti
    }
    
    init(from decoder: Decoder) throws {
        
    }
    
    func encode(to encoder: Encoder) throws {
        
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Profile {
    static var mock: Profile = .init(
        id: UUID(),
        nickname: "mock",
        description: "this is mock",
        mbti: .allCases.randomElement()!
    )
}
