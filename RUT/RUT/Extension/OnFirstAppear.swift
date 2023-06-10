//
//  OnFirstAppear.swift
//  RUT
//
//  Created by Ernest Hong on 2023/06/10.
//

import SwiftUI

extension View {
    func onFirstTask( action: @escaping @Sendable () async -> Void) -> some View {
        modifier(ViewFirstTaskModifier(action: action))
    }

    func onFirstAppear( action: @escaping () -> Void) -> some View {
        modifier(ViewFirstAppearModifier(action: action))
    }
}

fileprivate struct ViewFirstAppearModifier: ViewModifier {
    @State private var isFirstAppeared = false
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear {
                guard isFirstAppeared == false else { return }
                isFirstAppeared = true
                action()
            }
    }
}

fileprivate struct ViewFirstTaskModifier: ViewModifier {
    @State private var isFirstAppeared = false
    let action: @Sendable () async -> Void

    func body(content: Content) -> some View {
        content.task {
            guard isFirstAppeared == false else { return }
            isFirstAppeared = true
            await action()
        }
    }
}
