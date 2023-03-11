//
//  AuthenticationService.swift
//  Switch
//
//  Created by Stepan Vardanyan on 08.03.23.
//

import Foundation

struct AuthenticationService {

    func authenticate(username: String, password: String) async -> Result<Bool, Error> {
        try? await Task.sleep(until: .now + .seconds(3),clock: .suspending)
        let result = username == "Test" && password == "1234"
        return .success(result)
    }
}
