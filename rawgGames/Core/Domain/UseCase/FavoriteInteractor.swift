//
//  FavoriteInteractor.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 10/10/23.
//

import Foundation

protocol FavoriteUseCase {
    func getGameFavorite(completion: @escaping (Result<[GameModel], Error>) -> Void)
    func deleteGameFavorite(with game: GameModel, completion: @escaping (Bool) -> Void)
}

class FavoriteInteractor: FavoriteUseCase {
    
    private let favoRepo: FavoriteRepositoryProtocol
    
    init(favoRepo: FavoriteRepositoryProtocol) {
        self.favoRepo = favoRepo
    }
    
    func getGameFavorite(completion: @escaping (Result<[GameModel], Error>) -> Void) {
        favoRepo.getGameFavorite { result in
            completion(result)
        }
    }
    
    func deleteGameFavorite(with game: GameModel, completion: @escaping (Bool) -> Void) {
        favoRepo.deleteGameFavorite(with: game) { result in
            completion(result)
        }
    }
    
}
