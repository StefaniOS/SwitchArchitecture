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

    private func startLogin() {
        store.dispatch(.user(action: .authentication(action: .startLogin)))
    }
}

extension AuthenticationInteractor {

    var usernameInitialValue: String { userState.validation.usernameInput }
    var passwordInitialValue: String { userState.validation.passwordInput }
    var isAuthenticated: Bool { userState.authentication.authenticated }
    var isAuthenticating: Bool { userState.authentication.isRequesting }

    func executeLogin() {
        guard isValid else { return }

        startLogin()

        Task {
            let result = await loginUseCase.execute()
            if case .success = result {
                resetUserInputs()
            }
        }
    }

    func executeLogout() {
        logoutUseCase.execute()
    }

    func onUsernameInputChange(_ newValue: String) {
        store.dispatch(.user(action: .validation(action: .changeUsernameInput(newValue))))
    }

    func onPasswordInputChange(_ newValue: String) {
        store.dispatch(.user(action: .validation(action: .changePasswordInput(newValue))))
    }

    func resetUserInputs() {
        store.dispatch(.user(action: .validation(action: .resetInputs)))
    }
}
