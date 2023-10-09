//
//  GameRepository.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 02/10/23.
//

import Foundation

protocol GameRepositoryProtocol {
    func getGame(completion: @escaping (Result<[GameModel], Error>) -> Void)
}

class GameRepository: GameRepositoryProtocol {
    
    private let gameDataSource: GameDataSourceProtocol
    
    init(gameDataSource: GameDataSourceProtocol) {
        self.gameDataSource = gameDataSource
    }
    
    func getGame(completion: @escaping (Result<[GameModel], Error>) -> Void) {
        gameDataSource.getGameDataSource(completion: {
            result in
            switch result {
            case .success(let data):
                let gameModel = GameMapper.mapGameResponsesToDomains(input: data)
                completion(.success(gameModel))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
