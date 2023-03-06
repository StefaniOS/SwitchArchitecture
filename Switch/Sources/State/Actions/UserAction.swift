//
//  UserActions.swift
//  Switch
//
//  Created by Stepan Vardanyan on 06.03.23.
//

enum UserAction {
    case authentication(action: Authentication)
}

extension UserAction {

    enum Authentication {
        case login
        case logout
    }
}
