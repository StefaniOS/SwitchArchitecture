//
//  AuthenticationInteractor.swift
//  Switch
//
//  Created by Stepan Vardanyan on 07.03.23.
//

import Foundation

protocol AuthenticationInteractorProtocol: Interactor {
    func validate(username: String, password: String) -> Bool
    func executeLogin(username: String, password: String)
    func executeLogout()
}

struct AuthenticationInteractor: AuthenticationInteractorProtocol {

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

extension AuthenticationInteractor {

    typealias StateProvider = UserStateProvider

    typealias UseCaseProviders = ValidateUsernameUseCaseProvider &
                                 ValidatePasswordUseCaseProvider &
                                 LoginUseCaseProvider &
                                 LogoutUseCaseProvider

    typealias DependencyProviders = StateProvider & UseCaseProviders

    struct Dependencies: DependencyProviders {
        //States
        var userState: UserState

        // UseCases
        var validateUsernameUseCase: ValidateUsernameUseCase
        var validatePasswordUseCase: ValidatePasswordUseCase
        var loginUseCase: LoginUseCase
        var logoutUseCase: LogoutUseCase

        init(validateUsernameUseCase: ValidateUsernameUseCase = .init(),
             validatePasswordUseCase: ValidatePasswordUseCase = .init(),
             loginUseCase: LoginUseCase,
             logoutUseCase: LogoutUseCase,
             stateProvider: StateProvider) {
            self.validateUsernameUseCase = validateUsernameUseCase
            self.validatePasswordUseCase = validatePasswordUseCase
            self.loginUseCase = loginUseCase
            self.logoutUseCase = logoutUseCase
            self.userState = stateProvider.userState
        }
    }
}

extension AuthenticationInteractor {

    func validate(username: String, password: String) -> Bool {
        let isValidUsername = dependencies.validateUsernameUseCase.execute(username: username)
        let isValidPassword = dependencies.validatePasswordUseCase.execute(password: password)
        return isValidUsername && isValidPassword
    }

    func executeLogin(username: String, password: String) {
        Task {
            await dependencies.loginUseCase.execute(username: username, password: password)
        }
    }

    func executeLogout() {
        dependencies.logoutUseCase.execute()
    }
}
