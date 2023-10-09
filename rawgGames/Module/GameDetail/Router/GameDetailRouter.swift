//
//  GameDetailRouter.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 09/10/23.
//

import Foundation

protocol GameDetailRouterProtocol {
    static func routeToGameDetail()
}

class GameDetailRouter: GameDetailRouterProtocol {
    static func routeToGameDetail() {
        print("success")
    }
}
