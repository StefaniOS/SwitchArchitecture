//
//  ContentView.swift
//  Switch
//
//  Created by Stepan Vardanyan on 07.03.23.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var store: AppStore

    init(store: AppStore) {
        self.store = store
    }

    var body: some View {
        AuthenticationView(viewModel: .init(interactor: .init(store: store,
                                                              validateUsernameUseCase: .init(),
                                                              validatePasswordUseCase: .init(),
                                                              loginUseCase: .init(store: store),
                                                              logoutUseCase: .init(store: store))))
    }
}
