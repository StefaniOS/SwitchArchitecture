//
//  ViewFactory.swift
//  Switch
//
//  Created by Stepan Vardanyan on 13.03.23.
//

import SwiftUI

struct ViewFactory {

    static func makeAuthenticationView(store: AppStore) -> some View {
        let interactor: AuthenticationInteractor = .init(dependencies: .init(loginUseCase: .init(store: store),
                                                                             logoutUseCase: .init(store: store),
                                                                             stateProvider: store))
        let presenter: AuthenticationPresenter = .init(dependencies: .init(stateProvider: store, interactor: interactor))
        let viewModel: AuthenticationViewModel = .init(dataSource: presenter)
        return AuthenticationView(presenter: presenter, viewModel: viewModel)
    }
}
