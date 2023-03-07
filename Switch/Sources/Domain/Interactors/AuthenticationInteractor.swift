//
//  AuthenticationInteractor.swift
//  Switch
//
//  Created by Stepan Vardanyan on 07.03.23.
//

import Foundation

struct AuthenticationInteractor {

    // Store
    private let store: AppStore

    // States
    private let userState: UserState

    // UseCases
    private let loginUseCase: LoginUseCase
    private let logoutUseCase: LogoutUseCase

    init(store: AppStore) {
        self.store = store
        self.userState = store.state.userState
        self.loginUseCase = .init(store: store)
        self.logoutUseCase = .init(store: store)
    }
}

extension AuthenticationInteractor {

    var isAuthenticated: Bool { userState.authentication.authenticated }
}

extension AuthenticationInteractor {

    func onAuthenticate() {
        if isAuthenticated {
            logoutUseCase.execute()
        } else {
            loginUseCase.execute()
        }
    }
}
