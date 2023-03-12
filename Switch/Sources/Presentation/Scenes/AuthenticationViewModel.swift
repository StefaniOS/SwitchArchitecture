//
//  AuthenticationViewModel.swift
//  Switch
//
//  Created by Stepan Vardanyan on 12.03.23.
//

protocol AuthenticationViewModelProtocol {
    var imageName: String { get }
    var actionTitle: String { get }
    var resetTitle: String { get }
}

protocol AuthenticationViewModelDataSource {
    var isAuthenticated: Bool { get }
}

struct AuthenticationViewModel: ViewModel {
    
    private let dataSource: AuthenticationViewModelDataSource

    init(dataSource: AuthenticationViewModelDataSource) {
        self.dataSource = dataSource
    }
}

extension AuthenticationViewModel: AuthenticationViewModelProtocol {

    var imageName: String { dataSource.isAuthenticated ? "lock.open.fill" : "lock.fill" }
    var actionTitle: String { dataSource.isAuthenticated ? "Logout" : "Login" }
    var resetTitle: String { "Reset" }
}
