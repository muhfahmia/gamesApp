//
//  MainTabBarController.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 30/09/23.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tabBar.tintColor = .black
        let tabBarAppereance = UITabBarAppearance()
        tabBarAppereance.backgroundColor = .white
        self.tabBar.standardAppearance = tabBarAppereance
        configureController()
    }
    
    private func configureController() {
        let gamesListVC = GameRouter.startGame()
        let favoriteVC = FavoriteViewController()
        let aboutVC = AboutViewController()
        let games = setupNavigationController(title: "Games", inactiveImage: UIImage(systemName: "gamecontroller")!, activeImage: UIImage(systemName: "gamecontroller.fill")!, rootViewController: gamesListVC)
        let favorite = setupNavigationController(title: "Favorite", inactiveImage: UIImage(systemName: "heart")!, activeImage: UIImage(systemName: "heart.fill")!, rootViewController: favoriteVC)
        let about = setupNavigationController(title: "About", inactiveImage: UIImage(systemName: "person")!, activeImage: UIImage(systemName: "person.fill")!, rootViewController: aboutVC)
        
        setViewControllers([games, favorite, about], animated: true)
        
    }
    
    private func setupNavigationController(title: String, inactiveImage: UIImage, activeImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav =  UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = inactiveImage
        nav.tabBarItem.selectedImage = activeImage
        nav.tabBarItem.title = title
        nav.navigationBar.isTranslucent = false
        nav.navigationBar.barTintColor = UIColor.white
        nav.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]

        return nav
    }
}
