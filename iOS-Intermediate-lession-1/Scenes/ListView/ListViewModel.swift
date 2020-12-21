//
//  ListViewModel.swift
//  iOS-Intermediate-lession-1
//
//  Created by klaudia paprika on 11/23/20.
//  Copyright © 2020 klaudia paprika. All rights reserved.
//

import Foundation

protocol ListViewModelInterface {
    func getListOfString() -> [String]
}


class ListViewModel {
    weak var flowDelegate: ListViewFlowDelegate?
    weak var view: ListViewProtocol?
    var items: [String]?
    
    init(delegate: ListViewFlowDelegate, view: ListViewProtocol){
        self.flowDelegate = delegate
        self.view = view
    }
}


// MARK: -extension for ListViewModelInterface
extension ListViewModel: ListViewModelInterface {
    func getListOfString() -> [String] {
        return items ?? []
    }
}
