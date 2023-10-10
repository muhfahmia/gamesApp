//
//  GameDetailRouter.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 09/10/23.
//

import Foundation
import UIKit

protocol GameDetailRouterProtocol {
    static func routeToGameDetail(withID id: Int) -> UIViewController
}

class GameDetailRouter: GameDetailRouterProtocol {
    static func routeToGameDetail(withID id: Int) -> UIViewController {
        let gameDetailVC = GameDetailViewController()
        let provideGameDataSource = GameDataSource.remoteGameDataSource
        let provideGameFavoSource = GameFavoriteDataSource.sharedMovieFavoSource
        let gameRepo = GameRepository(gameDataSource: provideGameDataSource, gameFavoDataSource: provideGameFavoSource)
        let gameInteractor = GameInteractor(gameRepository: gameRepo)
        let gameDetailPresenter = GameDetailPresenter(gameDetailInteractor: gameInteractor)
        gameDetailPresenter.gameDetailID = id
        gameDetailPresenter.gameDetailView = gameDetailVC
        gameDetailVC.gameDetailPresenter = gameDetailPresenter
        return gameDetailVC
    }
}
