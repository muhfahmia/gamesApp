//
//  APICall.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 02/10/23.
//

import Foundation

struct APIConfig {

    static let baseUrl = "https://api.rawg.io/api/"
    static let apiKey = "4793aff64612497684820c9032c19118"

}

protocol Endpoint {

  var url: String { get }

}

enum Endpoints {
    
  enum rawg: Endpoint {
      
    case gameList
      case gameListMirror
      
    public var url: String {
        switch self {
        case .gameList: return "\(APIConfig.baseUrl)games"
        case .gameListMirror: return "https://rawg-mirror.vercel.app/api/games"
        }
    }
  }
}
