//
//  MBTITogether.swift
//  RUT
//
//  Created by Ernest Hong on 2023/06/10.
//

import Foundation
import GroupActivities

struct MBTITogether: GroupActivity {
    
    static var activityIdentifier: String = "com.letus.RUT.MBTITogether"
    
    var metadata: GroupActivityMetadata {
        var metadata = GroupActivityMetadata()
        metadata.title = NSLocalizedString("RUT?", comment: "너 T야?")
        metadata.type = .generic
        return metadata
    }
}
