//
//  AuthenticationViewModel.swift
//  Switch
//
//  Created by Stepan Vardanyan on 07.03.23.
//

import Foundation

struct AuthenticationViewModel {

    private var isAuthenticated: Bool { interactor.isAuthenticated }

    private let interactor: AuthenticationInteractor

    init(interactor: AuthenticationInteractor) {
        self.interactor = interactor
    }

    func onAction() {
        interactor.onAuthenticate()
    }
}

extension AuthenticationViewModel {

    var imageName: String { isAuthenticated ? "lock.open.fill" : "lock.fill" }
    var actionTitle: String { isAuthenticated ? "Logout" : "Login" }
}
