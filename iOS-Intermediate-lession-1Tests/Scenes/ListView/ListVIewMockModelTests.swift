//
//  ListVIewMockModelTests.swift
//  iOS-Intermediate-lession-1Tests
//
//  Created by klaudia paprika on 11/24/20.
//  Copyright © 2020 klaudia paprika. All rights reserved.
//

import XCTest

@testable import iOS_Intermediate_lession_1
class ListVIewMockModelTests: XCTestCase {
    var loginViewMock: LoginViewMockInterface!
    var model: LoginVIewModel!
    var flow: LoginFlowMockDelegate!
        
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        flow = LoginFlowMockDelegate()
        loginViewMock = LoginViewMockInterface()
        model = LoginVIewModel(view: loginViewMock, delegate: flow)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func failLogin() {
        model.login()
    }

}
