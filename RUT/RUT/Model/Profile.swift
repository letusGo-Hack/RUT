//
//  Profile.swift
//  RUT
//
//  Created by 한상진 on 2023/06/10.
//

import Foundation

public struct Profile: Codable, Identifiable, Hashable {
    public let id: UUID
    public let nickname: String
    public let description: String
    public let mbti: String
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

public extension Profile {
    static var mock: Self = .init(
        id: UUID(),
        nickname: "mock",
        description: "this is mock",
        mbti: "ESTJ"
    )
}
