//
//  ContentView.swift
//  Switch
//
//  Created by Stepan Vardanyan on 25.02.23.
//

import SwiftUI

struct ContentView: View {

    @StateObject var store: AppStore = .init(state: AppState.default, reducer: appReducer)

    private var authenticated: Bool { store.state.userState.authentication.authenticated }

    var body: some View {
        VStack {
            Image(systemName: authenticated ? "lock.open.fill" : "lock.fill")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Button {
                onAction()
            } label: {
                Text(authenticated ? "Logout" : "Login")
            }

        }
        .padding()
    }

    private func onAction() {
        if authenticated {
            store.dispatch(.user(action: .authentication(action: .logout)))
        } else {
            store.dispatch(.user(action: .authentication(action: .login)))
        }
    }
}
