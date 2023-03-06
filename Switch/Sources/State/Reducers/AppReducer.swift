//
//  AppReducer.swift
//  Switch
//
//  Created by Stepan Vardanyan on 06.03.23.
//

func appReducer(state: inout AppState, action: AppAction) -> Void {
    switch action {
    case .user(action: let action):
        userReducer(state: &state.userState, action: action)
    }
}
