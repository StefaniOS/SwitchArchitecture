//
//  AppReducer.swift
//  Switch
//
//  Created by Stepan Vardanyan on 06.03.23.
//

func userReducer(state: inout UserState, action: UserAction) -> Void {
    switch action {
    case .authentication(action: .login):
        state.authentication.authenticated = true
    case .authentication(action: .logout):
        state.authentication.authenticated = false
    }
}
