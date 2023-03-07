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

    func execute() {
        store.dispatch(.user(action: .authentication(action: .login)))
    }
}
