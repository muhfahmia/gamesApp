//
//  GameRouter.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 02/10/23.
//

import Foundation
import UIKit

protocol GameRouterProtocol {
    static func startGame() -> UIViewController
    func routeToGameDetail(withID id: Int, on view: GameViewProtocol)
}

class GameRouter: GameRouterProtocol {
    
    static func startGame() -> UIViewController {
        
        let gameRepository = GameRepository(gameDataSource: GameDataSource.remoteGameDataSource, gameFavoDataSource: GameFavoriteDataSource.sharedMovieFavoSource)
        let gameInteractor = GameInteractor(gameRepository: gameRepository)
        let gamePresenter = GamePresenter(gameInteractor: gameInteractor)
        let gameVC = GameViewController()
        gameVC.gamePresenter = gamePresenter
        gameVC.gamePresenter?.gameView = gameVC
        gamePresenter.gameRouter = GameRouter()
        return gameVC
    }
    
    func routeToGameDetail(withID id: Int, on view: GameViewProtocol) {
        let gameDetailVC = GameDetailRouter.routeToGameDetail(withID: id)
        gameDetailVC.hidesBottomBarWhenPushed = true
        let gameVC = view as? GameViewController
        gameVC?.navigationController?.pushViewController(gameDetailVC, animated: true)
    }
    
}
