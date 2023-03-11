//
//  AppReducer.swift
//  Switch
//
//  Created by Stepan Vardanyan on 06.03.23.
//

func userReducer(state: inout UserState, action: UserAction) -> Void {
    switch action {
    case .authentication(let action):
        userAuthenticationReducer(state: &state.authentication, action: action)
    }
}

private func userAuthenticationReducer(state: inout UserState.Authentication, action: UserAction.Authentication) -> Void {
    switch action {
    case .startLogin:
        state.isRequesting = true
    case .finishLogin(result: let result):
        state.isRequesting = false
        switch result {
        case .success(let authenticated):
            state.authenticated = authenticated
        case .failure:
            state.authenticated = false
        }
    case .logout:
        state.authenticated = false
    }
}
