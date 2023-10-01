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
//        let movieListVC = MovieListViewController()
//        let di = MovieListDI.init().provideMovieList()
//        let movieListUseCase = MovieListPresenter(movieListUseCase: di, movieListView: movieListVC)
       
//        movieListVC.movieListPresenter = movieListUseCase
        let gamesListVC = GameListViewController()
        let games = setupNavigationController(title: "Games", inactiveImage: UIImage(systemName: "film")!, activeImage: UIImage(systemName: "gamecontroller.fill")!, rootViewController: gamesListVC)
//        let tvShows = setupNavigationController(title: "TV Shows", inactiveImage: UIImage(systemName: "tv")!, activeImage: UIImage(systemName: "tv.fill")!, rootViewController: TVShowsController())
        
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
