//
//  UserActions.swift
//  Switch
//
//  Created by Stepan Vardanyan on 06.03.23.
//

enum UserAction {
    case authentication(action: Authentication)
    case validation(action: Validation)
}

extension UserAction {

    enum Authentication {
        case startLogin
        case onLoginCompleted(result: Result<Bool, Error>)
        case logout
    }
}

extension UserAction {

    enum Validation {
        case changeUsernameInput(_ username: String)
        case changePasswordInput(_ username: String)
        case resetInputs
    }
}
