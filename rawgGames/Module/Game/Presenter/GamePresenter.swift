//
//  GameListPresenter.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 02/10/23.
//

import Foundation

protocol GamePresenterProtocol {
    var gameView: GameViewProtocol? { get set }
    var gamePresenter: GamePresenterProtocol? { get set }
    var gameInteractor: GameUseCase? { get set}
    func getGame()
}

class GamePresenter: GamePresenterProtocol {
    
    var gameView: GameViewProtocol?
    var gamePresenter: GamePresenterProtocol?
    var gameInteractor: GameUseCase?
    
    init(gameInteractor: GameUseCase) {
        self.gameInteractor = gameInteractor
    }
    
    func getGame() {
        print("get game from presenter")
        self.gameInteractor?.getGame{ result in
            switch result {
            case .success(let data):
                self.gameView?.updateSuccessGame(with: data)
            case .failure(let error):
                print(error)
//                self.gameView?.updateGame()
            }
        }
    }
}

