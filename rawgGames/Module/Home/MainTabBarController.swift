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
        
        configureController()
    }
    
    private func configureController() {
        view.backgroundColor = .white
        let gamesListVC = GameRouter.startGame()
        let games = setupNavigationController(title: "Games", inactiveImage: UIImage(systemName: "gamecontroller")!, activeImage: UIImage(systemName: "gamecontroller.fill")!, rootViewController: gamesListVC)
        
        setViewControllers([games], animated: true)
        
    }
    
    private func setupNavigationController(title: String, inactiveImage: UIImage, activeImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav =  UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = inactiveImage
        nav.tabBarItem.selectedImage = activeImage
        nav.tabBarItem.title = title
        return nav
    }
    
    
}
