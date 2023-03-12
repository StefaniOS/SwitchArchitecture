//
//  ViewModel.swift
//  Switch
//
//  Created by Stepan Vardanyan on 11.03.23.
//

import Foundation

protocol ViewModel: ObservableObject {

    associatedtype Dependencies

    init(dependencies: Dependencies)
}
