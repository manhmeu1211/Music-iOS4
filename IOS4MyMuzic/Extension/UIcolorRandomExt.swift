//
//  UIcolorRandomExt.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 12/7/25.
//

import Foundation
import UIKit
extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red: CGFloat.random(in: 0.3...1),
            green: CGFloat.random(in: 0.3...1),
            blue: CGFloat.random(in: 0.3...1),
            alpha: 1.0
        )
    }
}
