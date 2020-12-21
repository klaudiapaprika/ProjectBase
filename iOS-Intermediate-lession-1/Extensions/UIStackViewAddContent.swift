//
//  UIStackViewAddContent.swift
//  iOS-Intermediate-lession-1
//
//  Created by klaudia paprika on 11/23/20.
//  Copyright © 2020 klaudia paprika. All rights reserved.
//

import UIKit

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, distribution: Distribution = .fill, spacing: CGFloat = 0, subviews: [UIView?] = []) {
        self.init(arrangedSubviews: subviews.compactMap {$0})
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
    }
    
    /// Removes all subviews.
    func clear() {
        self.subviews.forEach { $0.removeFromSuperview() }
    }

    @discardableResult
    func add<T: UIView>(_ subview: T?, spacing: CGFloat? = nil) -> T? {
        guard let subview = subview else { return nil }

        self.addArrangedSubview(subview)
        if let spacing = spacing {
            self.setCustomSpacing(spacing, after: subview)
        }
        return subview
    }
}
