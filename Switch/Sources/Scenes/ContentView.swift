//
//  ContentView.swift
//  Switch
//
//  Created by Stepan Vardanyan on 25.02.23.
//

import SwiftUI

struct ContentView: View {

    @StateObject var store: AppStore = .init(state: AppState.default, reducer: appReducer)

    private var userState: UserState { store.state.userState }

    var body: some View {
        VStack {
            Image(systemName: userState.authenticated ? "lock.open.fill" : "lock.fill")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Button {
                onAction()
            } label: {
                Text(userState.authenticated ? "Logout" : "Login")
            }

        }
        .padding()
    }

    private func onAction() {
        if userState.authenticated {
            store.dispatch(.user(action: .logout))
        } else {
            store.dispatch(.user(action: .login))
        }
    }
}
