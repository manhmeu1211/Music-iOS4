//
//  UITableView+Ext.swift
//  IOS4MyMuzic
//
//  Created by Nguyen Dinh Nhat Quang on 1/8/25.
//

import Foundation
import UIKit

extension UITableView {
    func register<T: UITableViewCell>(type: T.Type) {
        let name = String(describing: T.self)
        let nib = UINib(nibName: name, bundle: .main)

        if Bundle.main.path(forResource: name, ofType: "nib") != nil {
            self.register(nib, forCellReuseIdentifier: name)
        } else {
            self.register(T.self, forCellReuseIdentifier: name)
        }
    }

    func dequeueCell<T: UITableViewCell>(type: T.Type, indexPath: IndexPath)
        -> T?
    {
        let name = String(describing: T.self)
        guard
            let cell = self.dequeueReusableCell(
                withIdentifier: name,
                for: indexPath
            ) as? T
        else {
            fatalError("⚠️ Could not dequeue cell with identifier \(name)")
        }
        return cell
    }
}
