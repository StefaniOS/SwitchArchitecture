//
//  AuthenticationPresenter+Dependencies.swift
//  Switch
//
//  Created by Stepan Vardanyan on 13.03.23.
//

// MARK: - AuthenticationPresenter Dependencies

extension AuthenticationPresenter {

    typealias StateProvider = UserStateProvider
    typealias DependencyProviders = StateProvider & AuthenticationInteractorProvider

    struct Dependencies: DependencyProviders {

        var userState: UserState { stateProvider.userState }

        var interactor: any AuthenticationInteractorProtocol

        private var stateProvider: UserStateProvider

        init(stateProvider: StateProvider,
            interactor: any AuthenticationInteractorProtocol) {
            self.interactor = interactor
            self.stateProvider = stateProvider
        }
    }
}
