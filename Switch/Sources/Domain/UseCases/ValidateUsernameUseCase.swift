//
//  ValidateUsernameUseCase.swift
//  Switch
//
//  Created by Stepan Vardanyan on 11.03.23.
//

import Foundation

struct ValidateUsernameUseCase {

    func execute(username: String) -> Bool {
        let RegEx = "\\A\\w{4,12}\\z"
        let validation = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return validation.evaluate(with: username)
    }
}
