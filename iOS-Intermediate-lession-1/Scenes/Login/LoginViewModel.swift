//
//  LoginViewModel.swift
//  iOS-Intermediate-lession-1
//
//  Created by klaudia paprika on 11/23/20.
//  Copyright © 2020 klaudia paprika. All rights reserved.
//

import Foundation


protocol LoginViewModelInterface {
    func login()
}

class LoginVIewModel {
    var model: LoginData?
    weak var view: LoginViewInterface?
    weak var flowDelegate: LoginFlowDelegate?
    
    init(view: LoginViewInterface, delegate: LoginFlowDelegate) {
        self.view = view
        self.flowDelegate = delegate
    }
}


// MARK: -extension for LoginViewModelInterface
extension LoginVIewModel:  LoginViewModelInterface {
    func login() {
        view?.showLogin()
        view?.hideLogin()
        if AppSettings.mockUser == view?.getCredentials(){
            flowDelegate?.successFullyLoggedIn()
        }else {
            //popup
        }
    }
    
    
}
