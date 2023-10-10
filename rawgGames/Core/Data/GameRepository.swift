//
//  GameRepository.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 02/10/23.
//

import Foundation

protocol GameRepositoryProtocol {
    func getGame(completion: @escaping (Result<[GameModel], Error>) -> Void)
    func getGameDetail(withID id: Int, completion: @escaping (Result<GameModel, Error>) -> Void)
    func addGameFavo(with game: GameModel, completion: @escaping (Int) -> Void)
    func getGameWithID(withID id: Int, completion: @escaping (Bool) -> Void)
}

class GameRepository: GameRepositoryProtocol {
    
    private let gameDataSource: GameDataSourceProtocol
    private let gameFavoDataSource: GameFavoriteDataSourceProtocol
    
    init(gameDataSource: GameDataSourceProtocol, gameFavoDataSource: GameFavoriteDataSourceProtocol) {
        self.gameDataSource = gameDataSource
        self.gameFavoDataSource = gameFavoDataSource
    }
    
    func getGame(completion: @escaping (Result<[GameModel], Error>) -> Void) {
        gameDataSource.getGameDataSource(completion: { result in
            switch result {
            case .success(let data):
                let gameModel = GameMapper.mapGameResponsesToDomains(input: data)
                completion(.success(gameModel))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    func getGameDetail(withID id: Int, completion: @escaping (Result<GameModel, Error>) -> Void) {
        gameDataSource.getGameDetailDataSource(withID: id, completion: { result in
            switch result {
            case .success(let data):
                let gameModel = GameMapper.mapGameResponseDetailToDomains(input: data)
                completion(.success(gameModel))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    func addGameFavo(with game: GameModel, completion: @escaping (Int) -> Void) {
        gameFavoDataSource.addUserAction(with: game) { result in
            completion(result)
        }
    }
    
    func getGameWithID(withID id: Int, completion: @escaping (Bool) -> Void) {
        gameFavoDataSource.getGameWithID(withID: id) { result in
            completion(result)
        }
    }
}
