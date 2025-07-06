//
//  MainTabType.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 5/7/25.
//

import Foundation
import UIKit
enum MainTabType : String {
    case home
    case search
    case playlist
    case profile
    
    var title: String {
        return self.rawValue.capitalized
    }
    
    func icon(isSelected: Bool) -> UIImage? {
        return UIImage(named: "ic_\(self.rawValue)" + (isSelected ? "_selected" : ""))
    }
}
