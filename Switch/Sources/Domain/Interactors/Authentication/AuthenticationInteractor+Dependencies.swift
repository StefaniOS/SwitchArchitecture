//
//  AuthenticationInteractor+Dependencies.swift
//  Switch
//
//  Created by Stepan Vardanyan on 13.03.23.
//

// MARK: - AuthenticationInteractor Dependencies

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
