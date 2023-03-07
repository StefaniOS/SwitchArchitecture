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
    private var userState: UserState { store.state.userState }

    // UseCases
    private let loginUseCase: LoginUseCase
    private let logoutUseCase: LogoutUseCase

    init(store: AppStore) {
        self.store = store
        self.loginUseCase = .init(store: store)
        self.logoutUseCase = .init(store: store)
    }
}

extension AuthenticationInteractor {

    private var isValid: Bool {
        userState.validation.usernameInput == userState.validation.username &&
        userState.validation.passwordInput == userState.validation.password
    }
}

extension AuthenticationInteractor {

    var usernameInitialValue: String { userState.validation.usernameInput }
    var passwordInitialValue: String { userState.validation.passwordInput }
    var isAuthenticated: Bool { userState.authentication.authenticated }

    func executeLogin() {
        if isValid {
            loginUseCase.execute()
            store.dispatch(.user(action: .resetInputs))
        }
    }

    func executeLogout() {
        logoutUseCase.execute()
    }

    func onUsernameInputChange(_ newValue: String) {
        store.dispatch(.user(action: .changeUsernameInput(newValue)))
    }

    func onPasswordInputChange(_ newValue: String) {
        store.dispatch(.user(action: .changePasswordInput(newValue)))
    }
}
