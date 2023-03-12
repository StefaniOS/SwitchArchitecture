//
//  LoginUseCase.swift
//  Switch
//
//  Created by Stepan Vardanyan on 07.03.23.
//

import Foundation

struct LoginUseCase: UseCase {

    private let store: AppStore

    private var authenticationRepository: UserAuthenticationRepository

    init(store: AppStore,
         authenticationRepository: UserAuthenticationRepository = .init()) {
        self.store = store
        self.authenticationRepository = authenticationRepository
    }

    func execute(username: String, password: String) async -> Result<Bool, Error> {
        store.dispatch(.user(action: .authentication(action: .startLogin)))
        let result = await authenticationRepository.authenticate(username: username, password: password)
        store.dispatch(.user(action: .authentication(action: .finishLogin(result: result))))
        return result
    }
}
