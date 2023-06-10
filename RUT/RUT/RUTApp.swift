//
//  RUTApp.swift
//  RUT
//
//  Created by 한상진 on 2023/06/10.
//

import SwiftUI
import SwiftData

@main
struct RUTApp: App {

    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: Profile.self)
    }
}

struct RootView: View {
    @AppStorage("MyMBTI") var myMBTI: MBTIType?
    
    var body: some View {
        if let myMBTI {
            ContentView()
        } else {
            OnboardingProfileContentView()
        }
    }
}
