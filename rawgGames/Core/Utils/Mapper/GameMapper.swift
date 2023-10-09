//
//  GameMapper.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 09/10/23.
//

import Foundation

final class GameMapper {
    static func mapGameResponsesToDomains(input gameResponses: GameListResponse) -> [GameModel] {
        var gameModel: [GameModel] = []
        
        for game in gameResponses.games {
            var genres: [GameGenres] = []
            for genre in game.genres {
                genres.append(GameGenres(name: genre.name))
            }
            let game = GameModel(
                id: game.id,
                name: game.name,
                rating: game.rating,
                releaseDate: game.releaseDate,
                backgroundImage: game.backgroundImage,
                description: game.description,
                genres: genres
            )
            gameModel.append(game)
        }
    
        return gameModel
        
    }
}


