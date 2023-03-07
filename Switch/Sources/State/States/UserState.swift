//
//  UserState.swift
//  Switch
//
//  Created by Stepan Vardanyan on 06.03.23.
//

struct UserState {
    var authentication: Authentication = .init(authenticated: false)
    var validation: Validation = .init(username: "", password: "")
}

extension UserState {
    struct Authentication {
        var authenticated: Bool
    }
}

extension UserState {
    struct Validation {
        var usernameInput: String = ""
        var passwordInput: String = ""
        var username: String
        var password: String
    }
}
