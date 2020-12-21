//
//  LoginViewMockInterface.swift
//  iOS-Intermediate-lession-1Tests
//
//  Created by klaudia paprika on 11/24/20.
//  Copyright © 2020 klaudia paprika. All rights reserved.
//

import Foundation

@testable import iOS_Intermediate_lession_1

class LoginViewMockInterface: LoginViewInterface {
    
    var mockCredentials = LoginData(userName: "kpaprika", password: "password")
    func showLogin() {
        
    }
    
    func hideLogin() {
        
    }
    
    func getCredentials() -> LoginData? {
        return mockCredentials
    }
    
    func setCredential(newCredentials: LoginData) {
        mockCredentials = newCredentials
    }
}
