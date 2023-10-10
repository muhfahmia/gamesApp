//
//  GameModel.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 09/10/23.
//

import Foundation

struct GameModel: Hashable {
    let id: Int
    let name: String
    let rating: Double
    let releaseDate: String
    let backgroundImage: String
    let description: String
    let genres: [GameGenres]
    
}

struct GameGenres: Hashable {
    let name: String
}
