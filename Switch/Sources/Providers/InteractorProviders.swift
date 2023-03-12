//
//  InteractorProviders.swift
//  Switch
//
//  Created by Stepan Vardanyan on 11.03.23.
//

protocol AuthenticationInteractorProvider {
    var interactor: any AuthenticationInteractorProtocol { get }
}
