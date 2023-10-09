//
//  GameListResponse.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 02/10/23.
//

import Foundation

struct GameListResponse: Codable {
//    let gamesTotal: Int
    let games: [GameResponse]
    
    enum CodingKeys: String, CodingKey {
//        case gamesTotal = "count"
        case games = "results"
    }
    
}

struct GameResponse: Codable {
    let id: Int
    let name: String
    let rating: Double
    let releaseDate: String
    let genres: [GameGenresResponse]
    let description: String
    let backgroundImage: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case rating
        case releaseDate = "released"
        case genres
        case description = "description_raw"
        case backgroundImage = "background_image"
    }
}

struct GameGenresResponse: Codable {
    let name: String
}
