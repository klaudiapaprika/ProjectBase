//
//  UIview+Constraints.swift
//  iOS-Intermediate-lession-1
//
//  Created by klaudia paprika on 11/23/20.
//  Copyright © 2020 klaudia paprika. All rights reserved.
//

import UIKit

// MARK: - Constrain to superview
extension UIView {
    
    func pinToSuperview(along axis: NSLayoutConstraint.Axis? = nil,
                        padding: CGSize = .zero,
                        padLeading: CGFloat? = nil,
                        padTrailing: CGFloat? = nil,
                        padTop: CGFloat? = nil,
                        padBottom: CGFloat? = nil,
                        useSafeArea: Bool = true) {
        
        guard let target = superview else { return }
        pin(to: target,
            along: axis,
            padding: padding,
            padLeading: padLeading,
            padTrailing: padTrailing,
            padTop: padTop,
            padBottom: padBottom,
            useSafeArea: useSafeArea
        )
    }
}

extension UIView {

func pin(to target: UIView,
         along axis: NSLayoutConstraint.Axis? = nil,
         padding: CGSize = .zero,
         padLeading: CGFloat? = nil,
         padTrailing: CGFloat? = nil,
         padTop: CGFloat? = nil,
         padBottom: CGFloat? = nil,
         useSafeArea: Bool = true) {
    
    translatesAutoresizingMaskIntoConstraints = false
    var constraints = [NSLayoutConstraint]()
    if axis == nil || axis == .horizontal {
        constraints.append(contentsOf: [
            self.leadingAnchor.constraint(equalTo: useSafeArea ? target.safeAreaLayoutGuide.leadingAnchor : target.leadingAnchor,
                                          constant: padLeading ?? padding.width),
            self.trailingAnchor.constraint(equalTo: useSafeArea ? target.safeAreaLayoutGuide.trailingAnchor : target.trailingAnchor,
                                           constant: -(padTrailing ?? padding.width))
        ])
    }
    if axis == nil || axis == .vertical {
        constraints.append(contentsOf: [
            self.topAnchor.constraint(equalTo: useSafeArea ? target.safeAreaLayoutGuide.topAnchor : target.topAnchor,
                                      constant: padTop ?? padding.height),
            self.bottomAnchor.constraint(equalTo: useSafeArea ? target.safeAreaLayoutGuide.bottomAnchor : target.bottomAnchor,
                                         constant: -(padBottom ?? padding.height))
        ])
    }
    NSLayoutConstraint.activate(constraints)
}
}

extension UIView {

    func embedded(with padding: CGSize = CGSize.zero) -> UIView {
        let view = UIView()
        view.addSubview(self)
        self.pinToSuperview(padding: padding)

        return view
    }
}
