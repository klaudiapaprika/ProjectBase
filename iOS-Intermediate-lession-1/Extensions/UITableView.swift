//
//  UITableView.swift
//  iOS-Intermediate-lession-1
//
//  Created by klaudia paprika on 11/23/20.
//  Copyright © 2020 klaudia paprika. All rights reserved.
//

import UIKit

extension UITableView {

    func register<T: UITableViewCell>(_ viewType: T.Type) {
        let classNameString = String(describing: viewType)
        let nib = UINib(nibName: classNameString, bundle: nil)
        register(nib, forCellReuseIdentifier: classNameString)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let classNameString = String(describing: T.self)

        if let cell = dequeueReusableCell(withIdentifier: classNameString, for: indexPath) as? T {
            return cell
        }

        cellIsMissingError()
    }

    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_ viewType: T.Type) {
        let classNameString = String(describing: viewType)
        let nib = UINib(nibName: classNameString, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: classNameString)
    }
    
    func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>() -> T {
        let classNameString = String(describing: T.self)

        if let view = dequeueReusableHeaderFooterView(withIdentifier: classNameString) as? T {
            return view
        }

        cellIsMissingError()
    }
    
    private func cellIsMissingError() -> Never {
        fatalError("Could not dequeue cell!")
    }
}
