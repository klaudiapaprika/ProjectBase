//
//  LoginData.swift
//  iOS-Intermediate-lession-1
//
//  Created by klaudia paprika on 11/23/20.
//  Copyright © 2020 klaudia paprika. All rights reserved.
//

import Foundation

struct LoginData {
    var userName: String?
    var password: String?
}

// MARK: - extension for Equtable
extension LoginData: Equatable {
    static func == (lhs: LoginData, rhs: LoginData) -> Bool {
        return lhs.userName == rhs.userName && lhs.password == rhs.password
    }
}
