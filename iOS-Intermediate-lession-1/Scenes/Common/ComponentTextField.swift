//
//  ComponentTextField.swift
//  iOS-Intermediate-lession-1
//
//  Created by klaudia paprika on 11/23/20.
//  Copyright © 2020 klaudia paprika. All rights reserved.
//

import UIKit

class ComponentTextField: UITextField {
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    convenience init(text: String? = nil) {
        self.init()
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        autocapitalizationType = .none
        backgroundColor = .white
        adjustsFontForContentSizeCategory = true
        textColor = UIColor.black
        layer.cornerRadius = 3.0
        layer.borderWidth = 1.0
    }

}
