//
//  LoginUseCase.swift
//  Switch
//
//  Created by Stepan Vardanyan on 07.03.23.
//

import Foundation

struct LoginUseCase {

    private let store: AppStore

    private var authenticationRepository: UserAuthenticationRepository

    init(store: AppStore, authenticationRepository: UserAuthenticationRepository = .init()) {
        self.store = store
        self.authenticationRepository = authenticationRepository
    }

    func execute() async -> Result<Bool, Error> {
        let result = await authenticationRepository.authenticate()
        store.dispatch(.user(action: .authentication(action: .onLoginCompleted(result: result))))
        return result
    }
}
