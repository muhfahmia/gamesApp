//
//  GameDetailPresenter.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 09/10/23.
//

import Foundation

protocol GameDetailPresenterProtocol {
    var gameDetailPresenter: GameDetailPresenterProtocol? { get set }
}

class GameDetailPresenter: GameDetailPresenterProtocol {
    
    var gameDetailPresenter: GameDetailPresenterProtocol?
    
    private let gameDetailInteractor: GameUseCase
    
    init(gameDetailInteractor: GameUseCase) {
        self.gameDetailInteractor = gameDetailInteractor
    }
    
}
