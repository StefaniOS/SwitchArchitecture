//
//  UserCaseProvider.swift
//  Switch
//
//  Created by Stepan Vardanyan on 11.03.23.
//

protocol ValidateUsernameUseCaseProvider {
    var validateUsernameUseCase: ValidateUsernameUseCase { get }
}

protocol ValidatePasswordUseCaseProvider {
    var validatePasswordUseCase: ValidatePasswordUseCase { get }
}

protocol LoginUseCaseProvider {
    var loginUseCase: LoginUseCase { get }
}

protocol LogoutUseCaseProvider {
    var logoutUseCase: LogoutUseCase { get }
}
