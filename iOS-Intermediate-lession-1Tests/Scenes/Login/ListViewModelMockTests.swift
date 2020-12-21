//
//  ListViewModelMock.swift
//  iOS-Intermediate-lession-1Tests
//
//  Created by klaudia paprika on 11/23/20.
//  Copyright © 2020 klaudia paprika. All rights reserved.
//

import XCTest

@testable import iOS_Intermediate_lession_1
class ListViewModelMock: XCTestCase {

    var model: ListViewModel!
    var flow: ListFlowDelegateMock!
    var view: ListViewModelProtocolMock!
    var apiRequest: APIRequest!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        apiRequest = APIRequest()
        flow = ListFlowDelegateMock()
        view = ListViewModelProtocolMock()
        model = ListViewModel(delegate: flow, view: view)
        model.items = ["asd", "asd2"]
    }
    
    func testListURL() {
        XCTAssert(nil != URL(string: "\(AppSettings.shared.serverBaseAddress)\(Endpoints.list.rawValue)"))
    }

    func testItemsCount(){
        XCTAssert(2 == (model.getListOfString() as [String]).count)
    }
    
    func testFlow(){
        
    }
    
}
