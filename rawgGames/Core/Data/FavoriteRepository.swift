//
//  GameRepository.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 02/10/23.
//

import Foundation

protocol FavoriteRepositoryProtocol {
    func getGameFavorite(completion: @escaping (Result<[GameModel], Error>) -> Void)
    func deleteGameFavorite(with game: GameModel, completion: @escaping (Bool) -> Void)
    
}

class FavoriteRepository: FavoriteRepositoryProtocol {
    
    private let gameFavoDataSource: GameFavoriteDataSourceProtocol
    
    init(gameFavoDataSource: GameFavoriteDataSourceProtocol) {
        self.gameFavoDataSource = gameFavoDataSource
    }
    
    func getGameFavorite(completion: @escaping (Result<[GameModel], Error>) -> Void) {
        gameFavoDataSource.getGameFavorite { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func deleteGameFavorite(with game: GameModel, completion: @escaping (Bool) -> Void) {
        gameFavoDataSource.deleteGameFavorite(with: game) { result in
           completion(result)
        }
    }
    
}
