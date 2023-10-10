//
//  GameDetailPresenter.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 09/10/23.
//

import Foundation

protocol GameDetailPresenterProtocol {
    var gameDetailView: GameDetailViewProtocol? { get set }
    var gameDetailPresenter: GameDetailPresenterProtocol? { get set }
    func getGameDetail()
    var gameDetail: GameModel? { get set }
    var gameDetailID: Int? { get set }
}

class GameDetailPresenter: GameDetailPresenterProtocol {
    
    var gameDetailView: GameDetailViewProtocol?
    var gameDetailPresenter: GameDetailPresenterProtocol?
    
    var gameDetailID: Int?
    var gameDetail: GameModel?
    
    private let gameDetailInteractor: GameUseCase
    
    init(gameDetailInteractor: GameUseCase) {
        self.gameDetailInteractor = gameDetailInteractor
    }
    
    func getGameDetail() {
        gameDetailInteractor.getGameDetail(withID: self.gameDetailID ?? 0) { result in
            switch result {
            case .success(let data):
                self.gameDetail = data
                self.gameDetailView?.updateSuccesGame(with: data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
