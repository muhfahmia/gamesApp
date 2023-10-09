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
}

class GameRouter: GameRouterProtocol {
    static func startGame() -> UIViewController {
        
        let gameRepository = GameRepository(gameDataSource: GameDataSource.remoteGameDataSource)
        let gameInteractor = GameInteractor(gameRepository: gameRepository)
        let gamePresenter = GamePresenter(gameInteractor: gameInteractor)
        let gameVC = GameViewController()
        gameVC.gamePresenter = gamePresenter
        gameVC.gamePresenter?.gameView = gameVC
        return gameVC
    }
}
