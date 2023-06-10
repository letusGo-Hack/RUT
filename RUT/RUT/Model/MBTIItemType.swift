//
//  MBTIItemType.swift
//  RUT
//
//  Created by Dayuen Seong on 2023/06/10.
//

import SwiftUI

enum MBTIItemType: String, CaseIterable {
    case E
    case I
    case N
    case S
    case T
    case F
    case J
    case P
    
    static let firstCase: [Self] = [.E, .N, .T, .J]
    static let lastCase: [Self]  = [.I, .S, .F, .P]
    
    var backgroundColor: Color {
        switch self {
        case .E, .I, .T, .F: return .skyblue
        default:             return .blueLight
        }
    }
}
