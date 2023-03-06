//
//  UserState.swift
//  Switch
//
//  Created by Stepan Vardanyan on 06.03.23.
//

struct AppState {
    var userState: UserState
}

extension AppState {

    static let `default`: Self = .init(userState: .init(authenticated: false))
}
