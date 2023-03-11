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
    private let validateUsernameUseCase: ValidateUsernameUseCase
    private let validatePasswordUseCase: ValidatePasswordUseCase
    private let loginUseCase: LoginUseCase
    private let logoutUseCase: LogoutUseCase

    init(store: AppStore,
         validateUsernameUseCase: ValidateUsernameUseCase,
         validatePasswordUseCase: ValidatePasswordUseCase,
         loginUseCase: LoginUseCase,
         logoutUseCase: LogoutUseCase) {
        self.store = store
        self.validateUsernameUseCase = validateUsernameUseCase
        self.validatePasswordUseCase = validatePasswordUseCase
        self.loginUseCase = loginUseCase
        self.logoutUseCase = logoutUseCase
    }
}

extension AuthenticationInteractor {

    var isAuthenticated: Bool { userState.authentication.authenticated }
    var isAuthenticating: Bool { userState.authentication.isRequesting }

    func validate(username: String, password: String) -> Bool {
        let isValidUsername = validateUsernameUseCase.execute(username: username)
        let isValidPassword = validatePasswordUseCase.execute(password: password)
        return isValidUsername && isValidPassword
    }

    func executeLogin(username: String, password: String) {
        Task {
            await loginUseCase.execute(username: username, password: password)
        }
    }

    func executeLogout() {
        logoutUseCase.execute()
    }
}
