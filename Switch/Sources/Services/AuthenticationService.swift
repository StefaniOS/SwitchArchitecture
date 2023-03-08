//
//  AuthenticationService.swift
//  Switch
//
//  Created by Stepan Vardanyan on 08.03.23.
//

import Foundation

struct AuthenticationService {

    func authenticate() async -> Result<Bool, Error> {
        try? await Task.sleep(until: .now + .seconds(3),clock: .suspending)
        return .success(true)
    }
}
