//
//  GameRouter.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 02/10/23.
//

import Foundation
import UIKit

protocol FavoriteRouterProtocol {
    static func startFavorite() -> UIViewController
}

class FavoriteRouter: FavoriteRouterProtocol {
    
    static func startFavorite() -> UIViewController {
        let favoRepo = FavoriteRepository(gameFavoDataSource: GameFavoriteDataSource.sharedMovieFavoSource)
        let favoInteractor = FavoriteInteractor(favoRepo: favoRepo)
        let favoPresenter = FavoritePresenter(gameFavoriteInteractor: favoInteractor)
        let favoVC = FavoriteViewController()
        favoVC.favoritePresenter = favoPresenter
        favoPresenter.favoriteView = favoVC
        return favoVC
    }
    
}
