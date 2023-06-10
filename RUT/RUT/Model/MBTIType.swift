//
//  MBTIType.swift
//  RUT
//
//  Created by Dayuen Seong on 2023/06/10.
//

import Foundation
import SwiftUI

enum MBTIType: String, CaseIterable {
    case ISFJ
    case ISTJ
    case INFP
    case ISFP
    case ESFJ
    case ESTJ
    case ENFP
    case ESFP
    case INFJ
    case INTJ
    case INTP
    case ISTP
    case ENFJ
    case ENTJ
    case ENTP
    case ESTP
    
    var backgroundColor: Color {
        switch self {
        case .ISFJ:
            return .yellowLight
        case .ISTJ:
            return .greenLight
        case .INFP:
            return .purpleLight
        case .ISFP:
            return .redLight
        case .ESFJ:
            return .purple
        case .ESTJ:
            return .red
        case .ENFP:
            return .yellow
        case .ESFP:
            return.pink
        case .INFJ:
            return .blue
        case .INTJ:
            return .blueDark
        case .INTP:
            return .cyan
        case .ISTP:
            return .cyanLight
        case .ENFJ:
            return .green
        case .ENTJ:
            return .brown
        case .ENTP:
            return .blueLight
        case .ESTP:
            return .limegreen
        }
    }
}
