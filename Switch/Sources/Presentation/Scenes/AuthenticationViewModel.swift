//
//  AuthenticationViewModel.swift
//  Switch
//
//  Created by Stepan Vardanyan on 07.03.23.
//

import Foundation

class AuthenticationViewModel: ObservableObject {

    @Published var username: String = ""
    @Published var password: String = ""

    let interactor: AuthenticationInteractor

    init(interactor: AuthenticationInteractor) {
        self.interactor = interactor
    }
}

extension AuthenticationViewModel {

    var isAuthenticated: Bool { interactor.isAuthenticated }
    var imageName: String { isAuthenticated ? "lock.open.fill" : "lock.fill" }
    var actionTitle: String { isAuthenticated ? "Logout" : "Login" }
    var resetTitle: String { "Reset" }

    var shouldShowInputFields: Bool { !isAuthenticated }
    var shouldDisableInputView: Bool { interactor.isAuthenticating }
}

extension AuthenticationViewModel {

    func onReset() {
        username = ""
        password = ""
    }

    func onAction() {
        guard !isAuthenticated else {
            onLogout()
            return
        }

        onLogin()
    }

    private func onLogin() {
        guard interactor.validate(username: username, password: password) else {
            onReset()
            return
        }
        interactor.executeLogin(username: username, password: password)
    }

    private func onLogout() {
        interactor.executeLogout()
    }
}
