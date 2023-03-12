//
//  Mocks.swift
//  Switch
//
//  Created by Stepan Vardanyan on 13.03.23.
//

import SwiftUI

struct MockViewModel: AuthenticationViewModelProtocol {
    var imageName: String = "network"

    var actionTitle: String = "Mock Action"

    var resetTitle: String = "Mock Reset"
}

class MockPresenter: AuthenticationPresenterProtocol  {

    var username: String = "Test"

    var password: String = "•••••"

    var shouldShowInputFields: Bool = true

    var shouldDisableInputView: Bool = false

    func onAction() {
        print("Mock Action")
    }

    func onReset() {
        print("Mock Reset")
    }

    struct MyDependencies {}

    required init(dependencies: MyDependencies = .init()) {

    }
}

extension ViewFactory {
    static func makeMockAuthenticationView() -> some View {
        return AuthenticationView(presenter: MockPresenter(), viewModel: MockViewModel())
    }
}
