//
//  AuthenticationViewModel.swift
//  Switch
//
//  Created by Stepan Vardanyan on 07.03.23.
//

import Foundation

struct AuthenticationViewModel {

    private var isAuthenticated: Bool { userState.authentication.authenticated }

    private let store: AppStore
    private let userState: UserState

    init(store: AppStore) {
        self.store = store
        self.userState = store.state.userState
    }

    func onAction() {
        if isAuthenticated {
            store.dispatch(.user(action: .authentication(action: .logout)))
        } else {
            store.dispatch(.user(action: .authentication(action: .login)))
        }
    }
}

extension AuthenticationViewModel {

    var imageName: String { isAuthenticated ? "lock.open.fill" : "lock.fill" }
    var actionTitle: String { isAuthenticated ? "Logout" : "Login" }
}
