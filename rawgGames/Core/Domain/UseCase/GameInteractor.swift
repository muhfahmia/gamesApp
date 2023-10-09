//
//  GameInteractor.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 02/10/23.
//

import Foundation
protocol GameUseCase {
    func getGame(completion: @escaping (Result<[GameModel], Error>) -> Void)
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
}
