//
//  LoginViewController.swift
//  iOS-Intermediate-lession-1
//
//  Created by klaudia paprika on 11/23/20.
//  Copyright © 2020 klaudia paprika. All rights reserved.
//

import UIKit

protocol LoginViewInterface: class {
    func showLogin()
    func hideLogin()
    func getCredentials() -> LoginData?
}

class LoginViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet var scrollView: UIScrollView?
    @IBOutlet private weak var titleLabel: UITextView?
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentStackView: UIStackView!

    private var username: UITextField?
    private var password: UITextField?

    var model: LoginViewModelInterface!
    
    // MARK: - Setup

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        prepareView()
    }
    // MARK: - Privates
    private func prepareView() {
        self.titleLabel?.text = "Login Page"
        
        contentStackView.add(ComponentLabel(text: "Username"), spacing: 5)
        username = contentStackView.add(ComponentTextField(), spacing: 5)
        contentStackView.add(ComponentLabel(text: "Password") , spacing: 5)
        
        password = contentStackView.add(ComponentTextField(), spacing: 5)
        
        guard self.model != nil else { return }
        let button: UIButton = UIButton()
        button.backgroundColor = UIColor.black
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        button.titleLabel?.textColor = UIColor.black
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(selectIt), for: .allEvents)
        contentStackView.add(button, spacing: 5)
    }
    
    // MARK: - Actions
    @objc func selectIt() {
        model.login()
    }

}

// MARK: -extension for LoginViewInterface
extension LoginViewController: LoginViewInterface {
    func getCredentials() -> LoginData? {
        return LoginData(userName: username?.text, password: password?.text)
    }
    
    func showLogin() {
        // activity indicator start
    }
    
    func hideLogin() {
        //activity indicator stop
    }
    
    
}
