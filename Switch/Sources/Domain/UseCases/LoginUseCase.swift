//
//  LoginUseCase.swift
//  Switch
//
//  Created by Stepan Vardanyan on 07.03.23.
//

import Foundation

struct LoginUseCase {

    private let store: AppStore

    init(store: AppStore) {
        self.store = store
    }

    func execute() async -> Result<Bool, Error> {
        let result = await authenticate()
        store.dispatch(.user(action: .authentication(action: .onLoginCompleted(result: result))))
        return result
    }

    private func authenticate() async -> Result<Bool, Error> {
        try? await Task.sleep(until: .now + .seconds(3),clock: .suspending)
        return .success(true)
    }
}
