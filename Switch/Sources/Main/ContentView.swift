//
//  ContentView.swift
//  Switch
//
//  Created by Stepan Vardanyan on 07.03.23.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var store: AppStore

    init(store: AppStore) {
        self.store = store
    }

    var body: some View {
        ViewFactory.makeAuthenticationView(store: store)
    }
}
