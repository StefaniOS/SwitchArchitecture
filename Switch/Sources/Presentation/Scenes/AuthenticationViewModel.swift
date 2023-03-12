//
//  AuthenticationViewModel.swift
//  Switch
//
//  Created by Stepan Vardanyan on 07.03.23.
//

import Foundation

protocol AuthenticationViewModelProtocol: ViewModel {

    var username: String { get set }
    var password: String { get set }

    var isAuthenticated: Bool { get }
    var imageName: String { get }
    var actionTitle: String { get }
    var resetTitle: String { get }

    var shouldShowInputFields: Bool { get }
    var shouldDisableInputView: Bool { get }

    func onAction()
    func onReset()
}

class AuthenticationViewModel: AuthenticationViewModelProtocol {

    @Published var username: String = ""
    @Published var password: String = ""

    private var userState: UserState { dependencies.userState }
    private var interactor: any AuthenticationInteractorProtocol { dependencies.interactor }

    private let dependencies: Dependencies

    required init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

extension AuthenticationViewModel {

    typealias StateProvider = UserStateProvider
    typealias DependencyProviders = StateProvider & AuthenticationInteractorProvider

    struct Dependencies: DependencyProviders {

        var userState: UserState { stateProvider.userState }

        var interactor: any AuthenticationInteractorProtocol

        private var stateProvider: UserStateProvider

        init(stateProvider: StateProvider,
            interactor: any AuthenticationInteractorProtocol) {
            self.interactor = interactor
            self.stateProvider = stateProvider
        }
    }
}

extension AuthenticationViewModel {

    var isAuthenticated: Bool { userState.authentication.authenticated }
    var imageName: String { isAuthenticated ? "lock.open.fill" : "lock.fill" }
    var actionTitle: String { isAuthenticated ? "Logout" : "Login" }
    var resetTitle: String { "Reset" }

    var shouldShowInputFields: Bool { !isAuthenticated }
    var shouldDisableInputView: Bool { userState.authentication.isRequesting }
}

extension AuthenticationViewModel {

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
