//
//  AuthenticationInteractor.swift
//  Switch
//
//  Created by Stepan Vardanyan on 07.03.23.
//

protocol AuthenticationInteractorProtocol: Interactor {
    func validate(username: String, password: String) -> Bool
    func executeLogin(username: String, password: String)
    func executeLogout()
}

struct AuthenticationInteractor {

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

extension AuthenticationInteractor: AuthenticationInteractorProtocol {

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
