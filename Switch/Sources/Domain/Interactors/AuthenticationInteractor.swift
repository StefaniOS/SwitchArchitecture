//
//  AuthenticationInteractor.swift
//  Switch
//
//  Created by Stepan Vardanyan on 07.03.23.
//

import Foundation

struct AuthenticationInteractor {

    private let store: AppStore
    private let userState: UserState

    init(store: AppStore) {
        self.store = store
        self.userState = store.state.userState
    }
}

extension AuthenticationInteractor {

    var isAuthenticated: Bool { userState.authentication.authenticated }
}

extension AuthenticationInteractor {

    func onAuthenticate() {
        if isAuthenticated {
            store.dispatch(.user(action: .authentication(action: .logout)))
        } else {
            store.dispatch(.user(action: .authentication(action: .login)))
        }
    }
}
