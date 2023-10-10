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
    
    func addGameFavorite()
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
                self.getGameFromCoreData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func addGameFavorite() {
        gameDetailInteractor.addGameFavorite(with: self.gameDetail!) { result in
            if result == 0 {
                self.gameDetailView?.updateStateFavoriteBtn(with: "heart")
            }else{
                self.gameDetailView?.updateStateFavoriteBtn(with: "heart.fill")
            }
        }
    }
    
    func getGameFromCoreData() {
        gameDetailInteractor.getGameWithID(withID: self.gameDetail!.id) { result in
            if result == true {
                self.gameDetailView?.updateStateFavoriteBtn(with: "heart.fill")
            }else{
                self.gameDetailView?.updateStateFavoriteBtn(with: "heart")
            }
        }
    }
    
}
