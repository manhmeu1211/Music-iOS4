//
//  MainTabbarController.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 5/7/25.
//
import UIKit

class MainTabbarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setUpViewControllers()
        setUpTabBarAppearance()
    }
    
    func tabBarController(
        _ tabBarController: UITabBarController,
        didSelect viewController: UIViewController
    ) {
        debugPrint("Tab selected, updating indicator line.")
    }
    
    func setUpViewControllers() {
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(
            title: nil,
            image: MainTabType.home.icon(isSelected: false),
            selectedImage: MainTabType.home.icon(isSelected: true)
        )
        
        let searchVC = SearchViewController()
        searchVC.tabBarItem = UITabBarItem(
            title: nil,
            image: MainTabType.search.icon(isSelected: false),
            selectedImage: MainTabType.search.icon(isSelected: true)
        )
        
        let playlistVC = PlaylistViewController()
        playlistVC.tabBarItem = UITabBarItem(
            title: nil,
            image: MainTabType.playlist.icon(isSelected: false),
            selectedImage: MainTabType.playlist.icon(isSelected: true)
        )
        
        let profileVC = ProfileViewController()
        profileVC.tabBarItem = UITabBarItem(
            title: nil,
            image: MainTabType.profile.icon(isSelected: false),
            selectedImage: MainTabType.profile.icon(isSelected: true)
        )
        
        viewControllers = [homeVC, searchVC, playlistVC, profileVC]
        
        let iconInsets = UIEdgeInsets(top: 25, left: 15, bottom: 8, right: 15)
        
        for viewController in viewControllers ?? [] {
            viewController.tabBarItem.imageInsets = iconInsets
            viewController.tabBarItem.image = viewController.tabBarItem.image?.withRenderingMode(.alwaysOriginal)
            viewController.tabBarItem.selectedImage = viewController.tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    private func setUpTabBarAppearance() {
//        let appearance = UITabBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = .clear
//        appearance.backgroundImage = UIImage(named: "img_tabbar")
//        
//        tabBar.standardAppearance = appearance
//        tabBar.scrollEdgeAppearance = appearance

        let cornerRadius: CGFloat = 30
        let bgHeight: CGFloat = 80

        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .colorTabbar
        backgroundView.layer.cornerRadius = cornerRadius
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        backgroundView.layer.masksToBounds = true

        tabBar.insertSubview(backgroundView, at: 0)

        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -10),
            backgroundView.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor, constant: 10),
            backgroundView.heightAnchor.constraint(equalToConstant: bgHeight)
        ])

        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        tabBar.backgroundColor = .clear
        tabBar.isTranslucent = true
    }
    @IBAction func goToProfileButtonTapped(_ sender: Any) {
        self.selectedIndex = 3
       }
}
