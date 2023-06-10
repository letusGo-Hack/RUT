//
//  MBTITogether.swift
//  RUT
//
//  Created by Ernest Hong on 2023/06/10.
//

import Foundation
import GroupActivities

struct MBTITogether: GroupActivity {
    var metadata: GroupActivityMetadata {
        var metadata = GroupActivityMetadata()
        metadata.title = NSLocalizedString("Draw Together", comment: "Title of group activity")
        metadata.type = .generic
        return metadata
    }
}
