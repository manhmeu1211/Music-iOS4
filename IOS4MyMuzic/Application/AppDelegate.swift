//
//  AppDelegate.swift
//  IOS4MyMuzic
//
//  Created by Boi Phố on 30/6/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow()
        let HomeViewController = HomeViewController()
        self.window?.rootViewController = HomeViewController
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

