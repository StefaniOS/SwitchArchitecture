//
//  UserState.swift
//  Switch
//
//  Created by Stepan Vardanyan on 06.03.23.
//

struct UserState {
    var authentication: Authentication
}

extension UserState {
    
    struct Authentication {
        var authenticated: Bool
    }
}
