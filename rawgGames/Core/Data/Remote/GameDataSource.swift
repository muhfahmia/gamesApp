//
//  GameDataSource.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 02/10/23.
//

import Foundation
import Alamofire

protocol GameDataSourceProtocol {
    func getGameDataSource(completion: @escaping (Result<GameListResponse, AFError>) -> Void)
}

final class GameDataSource: NSObject {
    static let remoteGameDataSource: GameDataSource = GameDataSource()
    private override init() {}
}

extension GameDataSource: GameDataSourceProtocol {
    func getGameDataSource(completion: @escaping (Result<GameListResponse, AFError>) -> Void) {
        guard let url = URL(string: Endpoints.rawg.gameListMirror.url) else { return }
        
        let param = [
            "key": APIConfig.apiKey
        ] as [String : Any]
        
        AF.request(url, method: .get, parameters: param)
        .validate()
        .responseDecodable(of: GameListResponse.self) {
            response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

