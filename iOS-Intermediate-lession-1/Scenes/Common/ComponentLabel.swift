//
//  ComponentLabel.swift
//  iOS-Intermediate-lession-1
//
//  Created by klaudia paprika on 11/23/20.
//  Copyright © 2020 klaudia paprika. All rights reserved.
//

import UIKit

class ComponentLabel: UILabel {
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
        setup(text: text)
    }
    
    func setup(text: String?) {
        self.text = text
    }
    
    private func setupView() {
         self.translatesAutoresizingMaskIntoConstraints = false
         self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         self.numberOfLines = 0
         self.lineBreakMode = .byWordWrapping
         self.adjustsFontForContentSizeCategory = true
     }
}
