//
//  AppReducer.swift
//  Switch
//
//  Created by Stepan Vardanyan on 06.03.23.
//

func userReducer(state: inout UserState, action: UserAction) -> Void {
    switch action {
    case .login:
        state.authenticated = true
    case .logout:
        state.authenticated = false
    }
}
