//
//  GameListPresenter.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 02/10/23.
//

import Foundation

protocol GamePresenterProtocol {
    var games: [GameModel] { get set }
    var gameView: GameViewProtocol? { get set }
    var gameRouter: GameRouterProtocol? { get set }
    var gameInteractor: GameUseCase? { get set}
    func getGame()
    func routeToDetailGame(indexPath: IndexPath)
}

class GamePresenter: GamePresenterProtocol {
    
    var games: [GameModel] = []

    var gameView: GameViewProtocol?
    var gameRouter: GameRouterProtocol?
    var gameInteractor: GameUseCase?
    
    init(gameInteractor: GameUseCase) {
        self.gameInteractor = gameInteractor
    }
    
    func getGame() {
        self.gameInteractor?.getGame{ result in
            switch result {
            case .success(let data):
                self.games = data
                self.gameView?.updateSuccessGame(with: data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func routeToDetailGame(indexPath: IndexPath) {
        gameRouter?.routeToGameDetail(withID: self.games[indexPath.row].id, on: self.gameView!)
    }
}

