//
//  GameInteractor.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 02/10/23.
//

import Foundation
protocol GameUseCase {
    func getGame(completion: @escaping (Result<[GameModel], Error>) -> Void)
    func getGameDetail(withID id: Int, completion: @escaping (Result<GameModel, Error>) -> Void)
    func addGameFavorite(with game: GameModel, completion: @escaping (Int) -> Void)
    func getGameWithID(withID id: Int, completion: @escaping (Bool) -> Void)
}

class GameInteractor: GameUseCase {
    private let gameRepository: GameRepositoryProtocol
    
    required init(gameRepository: GameRepositoryProtocol) {
        self.gameRepository = gameRepository
    }
    
    func getGame(completion: @escaping (Result<[GameModel], Error>) -> Void) {
        gameRepository.getGame {
            result in completion(result)
        }
    }
    
    func getGameDetail(withID id: Int, completion: @escaping (Result<GameModel, Error>) -> Void) {
        gameRepository.getGameDetail(withID: id) {
            result in completion(result)
        }
    }
    
    func addGameFavorite(with game: GameModel, completion: @escaping (Int) -> Void) {
        gameRepository.addGameFavo(with: game) { result in
            completion(result)
        }
    }
    
    func getGameWithID(withID id: Int, completion: @escaping (Bool) -> Void) {
        gameRepository.getGameWithID(withID: id) { result in
            completion(result)
        }
    }
    
}
