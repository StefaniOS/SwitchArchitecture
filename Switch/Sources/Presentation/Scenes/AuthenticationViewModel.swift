//
//  AuthenticationViewModel.swift
//  Switch
//
//  Created by Stepan Vardanyan on 07.03.23.
//

import Foundation

class AuthenticationViewModel: ObservableObject {

    @Published var usernameInput: String { didSet { interactor.onUsernameInputChange(usernameInput) }}
    @Published var passwordInput: String { didSet { interactor.onPasswordInputChange(passwordInput) }}

    private var isAuthenticated: Bool { interactor.isAuthenticated }

    private let interactor: AuthenticationInteractor

    init(interactor: AuthenticationInteractor) {
        self.interactor = interactor
        self.usernameInput = interactor.usernameInitialValue
        self.passwordInput = interactor.passwordInitialValue
    }

    func onAction() {
        if isAuthenticated {
            interactor.executeLogout()
        } else {
            interactor.executeLogin()
        }
    }
}

extension AuthenticationViewModel {

    var imageName: String { isAuthenticated ? "lock.open.fill" : "lock.fill" }
    var actionTitle: String { isAuthenticated ? "Logout" : "Login" }

    var shouldShowInputFields: Bool { !isAuthenticated }
    var shouldDisableInputView: Bool { interactor.isAuthenticating }
}
