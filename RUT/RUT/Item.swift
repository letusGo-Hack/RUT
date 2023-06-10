//
//  Item.swift
//  RUT
//
//  Created by 한상진 on 2023/06/10.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
