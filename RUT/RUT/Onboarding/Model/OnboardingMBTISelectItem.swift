//
//  OnboardingMBTISelectItem.swift
//  RUT
//
//  Created by Dayuen Seong on 2023/06/10.
//

import SwiftData
import SwiftUI

struct OnboardingMBTISelectItem {
    var text: String
    /// 선택되었을 때 폰트 색상
    var selectedTextColor: Color
    /// 선택되었을 때 배경 색상
    var selectedBackgroundColor: Color
    /// 선택되었는지 여부
    var isSelected: Bool
}
