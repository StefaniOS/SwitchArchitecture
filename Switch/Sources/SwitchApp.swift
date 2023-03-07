//
//  SwitchApp.swift
//  Switch
//
//  Created by Stepan Vardanyan on 25.02.23.
//

import SwiftUI

@main
struct SwitchApp: App {

    private let store: AppStore = .init(state: AppState.default, reducer: appReducer)

    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
