//
//  AuthenticationPresenter.swift
//  Switch
//
//  Created by Stepan Vardanyan on 07.03.23.
//

import Foundation

protocol AuthenticationPresenterProtocol: Presenter {

    // Published
    var username: String { get set }
    var password: String { get set }

    // Presentation Logic
    var shouldShowInputFields: Bool { get }
    var shouldDisableInputView: Bool { get }

    // Actions
    func onAction()
    func onReset()
}

class AuthenticationPresenter {

    @Published var username: String = ""
    @Published var password: String = ""

    private var userState: UserState { dependencies.userState }
    private var interactor: any AuthenticationInteractorProtocol { dependencies.interactor }

    private let dependencies: Dependencies

    required init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - Private Methods

extension AuthenticationPresenter {

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

// MARK: - AuthenticationViewModelDataSource

extension AuthenticationPresenter: AuthenticationViewModelDataSource {

    var isAuthenticated: Bool { userState.authentication.authenticated }
}

// MARK: - AuthenticationPresenterProtocol

extension AuthenticationPresenter: AuthenticationPresenterProtocol {

    var shouldShowInputFields: Bool { !isAuthenticated }
    var shouldDisableInputView: Bool { userState.authentication.isRequesting }

    func onAction() {
        guard !isAuthenticated else {
            onLogout()
            return
        }
        onLogin()
    }

    func onReset() {
        username = ""
        password = ""
    }
}
