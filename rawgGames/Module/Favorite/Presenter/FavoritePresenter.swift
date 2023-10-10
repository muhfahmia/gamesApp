//
//  FavoritePresenter.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 10/10/23.
//

import Foundation

protocol FavoritePresenterProtocol {
    func getGameFavorite()
    var favoriteView: FavoriteViewProtocol? { get set }
}

class FavoritePresenter: FavoritePresenterProtocol {
    
    var gameFavoriteInteractor: FavoriteUseCase
    var favoriteView: FavoriteViewProtocol?
    
    init(gameFavoriteInteractor: FavoriteUseCase) {
        self.gameFavoriteInteractor = gameFavoriteInteractor
    }
    
    func getGameFavorite() {
        gameFavoriteInteractor.getGameFavorite { result in
            switch result {
            case .success(let data):
                self.favoriteView?.updateSuccessGame(with: data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
