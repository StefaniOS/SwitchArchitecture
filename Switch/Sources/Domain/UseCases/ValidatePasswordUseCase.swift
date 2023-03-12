//
//  ValidateUsernameUseCase.swift
//  Switch
//
//  Created by Stepan Vardanyan on 11.03.23.
//

import Foundation

struct ValidatePasswordUseCase: UseCase {

    func execute(password: String) -> Bool {
        let passwordRegEx = "^[0-9]+${4,12}"
        let validation = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return validation.evaluate(with: password)
    }
}
