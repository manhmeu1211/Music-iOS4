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
        let homeVC = MainTabbarController()
        self.window?.rootViewController = homeVC
        self.window?.makeKeyAndVisible()
        //let HomeViewController = MainTabbarController()
        let tabBarVC = MainTabbarController()
        self.window?.rootViewController = tabBarVC
        self.window?.makeKeyAndVisible()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let purchaseVC = SaleViewController()
            purchaseVC.modalPresentationStyle = .overFullScreen
            tabBarVC.present(purchaseVC, animated: true, completion: nil)
        }
        return true
    }

}

