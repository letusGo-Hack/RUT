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
    enum CodingKeys: String, CodingKey {
        case id
        case nickname
        case profileDescription
        case mbti
    }
    
    let id: UUID
    let nickname: String
    let profileDescription: String
    let mbti: MBTIType
    
    init(
        id: UUID,
        nickname: String,
        profileDescription: String,
        mbti: MBTIType
    ) {
        self.id = id
        self.nickname = nickname
        self.profileDescription = profileDescription
        self.mbti = mbti
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        nickname = try container.decode(String.self, forKey: .nickname)
        profileDescription = try container.decode(String.self, forKey: .profileDescription)
        mbti = try container.decode(MBTIType.self, forKey: .mbti)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(nickname, forKey: .nickname)
        try container.encode(profileDescription, forKey: .profileDescription)
        try container.encode(mbti, forKey: .mbti)
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Profile {
    static var mock: Profile = .init(
        id: UUID(),
        nickname: "mock",
        profileDescription: "this is mock",
        mbti: .allCases.randomElement()!
    )
}
