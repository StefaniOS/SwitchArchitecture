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
    case .validation(action: let action):
        userValidationReducer(state: &state.validation, action: action)
    }
}

private func userAuthenticationReducer(state: inout UserState.Authentication, action: UserAction.Authentication) -> Void {
    switch action {
    case .startLogin:
        state.isRequesting = true
    case .onLoginCompleted(result: let result):
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

private func userValidationReducer(state: inout UserState.Validation, action: UserAction.Validation) -> Void {
    switch action {
    case .changeUsernameInput(let username):
        state.usernameInput = username
    case .changePasswordInput(let password):
        state.passwordInput = password
    case .resetInputs:
        state.usernameInput = ""
        state.passwordInput = ""
    }
}
