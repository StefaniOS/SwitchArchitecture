//
//  ViewModelDataSource.swift
//  Switch
//
//  Created by Stepan Vardanyan on 12.03.23.
//

protocol ViewModel {

    associatedtype DataSource

    init(dataSource: DataSource)
}
