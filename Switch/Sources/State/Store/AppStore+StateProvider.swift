//
//  AppStore.swift
//  Switch
//
//  Created by Stepan Vardanyan on 05.03.23.
//

extension AppStore: UserStateProvider {
    var userState: UserState { state.userState }
}
