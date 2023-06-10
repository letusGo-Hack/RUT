//
//  ShareMBTIApp.swift
//  ShareMBTI
//
//  Created by 한상진 on 2023/06/10.
//

import SwiftUI
import SwiftData

@main
struct ShareMBTIApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
