//
//  Interactor.swift
//  Switch
//
//  Created by Stepan Vardanyan on 11.03.23.
//

protocol Interactor {

    associatedtype Dependencies

    init(dependencies: Dependencies)
}
