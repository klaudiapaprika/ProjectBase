//
//  AppCoordinator.swift
//  iOS-Intermediate-lession-1
//
//  Created by klaudia paprika on 11/23/20.
//  Copyright © 2020 klaudia paprika. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    let window: UIWindow?
    
    lazy var rootViewController: UINavigationController = {
        let vc = LoginViewController.instantiate()
        let model = LoginVIewModel(view: vc, delegate: self)
        vc.model = model
        return UINavigationController(rootViewController: vc)
    }()
    
    // MARK: - Coordinator
    init(window: UIWindow?) {
        self.window = window
    }
    
    override func start() {
        guard let window = window else {
            return
        }
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    override func finish() {
        
    }
    
    func goToLoginViewController() {
        let vc = LoginViewController.instantiate()
        rootViewController.show(vc, sender: self)
    }
}

// MARK: - Fllows
protocol LoginFlowDelegate: class {
    func successFullyLoggedIn()
}

protocol ListViewFlowDelegate: class {
    func navigateBack()
}

// MARK: - extensions for LoginFlowDelegate
extension AppCoordinator: LoginFlowDelegate {
    func successFullyLoggedIn() {
        let vc = ListViewController.instantiate()
        let model = ListViewModel(delegate: self, view: vc)
        
        APIListRequest().dispatch(onSuccess: { response in
            model.items = response.components(separatedBy: "\n")
        }) { (response, error) in
            //nothing
        }
        rootViewController.show(vc, sender: self)
        vc.model = model
        
    }
}

// MARK: -extension for ListViewFlowDelegate
extension AppCoordinator: ListViewFlowDelegate {
    func navigateBack() {
        
    }
}
