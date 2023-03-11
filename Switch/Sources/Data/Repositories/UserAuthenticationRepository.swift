//
//  UserAuthenticationRepository.swift
//  Switch
//
//  Created by Stepan Vardanyan on 08.03.23.
//

import Foundation

struct UserAuthenticationRepository {

    private let authenticationService: AuthenticationService

    init(authenticationService: AuthenticationService = .init()) {
        self.authenticationService = authenticationService
    }

    func authenticate(username: String, password: String) async -> Result<Bool, Error> {
        await authenticationService.authenticate(username: username, password: password)
    }
}
