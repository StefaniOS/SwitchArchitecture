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
        makeAuthenticationView()
    }

    func makeAuthenticationView() -> some View {
        let interactor: AuthenticationInteractor = .init(dependencies: .init(loginUseCase: .init(store: store),
                                                                             logoutUseCase: .init(store: store),
                                                                             stateProvider: store))
        let viewModel: AuthenticationViewModel = .init(dependencies: .init(stateProvider: store, interactor: interactor))
        return AuthenticationView(viewModel: viewModel)
    }
}
