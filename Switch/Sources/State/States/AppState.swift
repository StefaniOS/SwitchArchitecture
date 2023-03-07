//
//  UserState.swift
//  Switch
//
//  Created by Stepan Vardanyan on 06.03.23.
//

struct AppState {
    var userState: UserState = .init()
}

extension AppState {

    static let `default`: Self = .init(userState: .init(authentication: .init(authenticated: false),
                                                        validation: .init(username: "test", password: "1234")))
}
