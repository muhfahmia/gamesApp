//
//  GameFavoriteDataSource.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 10/10/23.
//

import Foundation
import CoreData

protocol GameFavoriteDataSourceProtocol {
    func addUserAction(with game: GameModel, completion: @escaping (Int) -> Void)
    func getGameFavorite(completion: @escaping (Result<[GameModel], Error>) -> Void)
    func getGameWithID(withID id: Int, completion: @escaping (Bool) -> Void)
    func deleteGameFavorite(with game: GameModel, completion: @escaping (Bool) -> Void)
}

class GameFavoriteDataSource: GameFavoriteDataSourceProtocol {
    private let container = NSPersistentContainer(name: "Game")
    private let context: NSManagedObjectContext
    private let gameEntity: NSEntityDescription
    
    static let sharedMovieFavoSource: GameFavoriteDataSource = GameFavoriteDataSource()
    
    init() {
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        self.context = container.viewContext
        self.gameEntity = NSEntityDescription.entity(forEntityName: "Game", in: self.context)!
    }
    
    func addUserAction(with game: GameModel, completion: @escaping (Int) -> Void) {
        getGameWithID(withID: game.id) { result in
            if result == true {
                self.deleteGameFavorite(with: game) { resultDelete in
                    completion(0)
                }
            }else{
                self.addGameFavorite(with: game) { resultAdd in
                    completion(1)
                }
            }
        }
    }
    
    func getGameFavorite(completion: @escaping (Result<[GameModel], Error>) -> Void) {
        let fetchRequest: NSFetchRequest<Game> = Game.fetchRequest()
        do {
            let games = try context.fetch(fetchRequest)
            var gamesModel: [GameModel] = []
            for game in games {
                let gameName = game.value(forKey: "name") as? String ?? ""
                let gameID = game.value(forKey: "gameID") as? Int64 ?? Int64(0)
                let rating = game.value(forKey: "rating") as? Double ?? 0
                let backgroundImage = game.value(forKey: "backgroundImage") as? String ?? ""
                let gameRelease = game.value(forKey: "releaseDate") as? String ?? ""
                let gameModel = GameModel(id: Int(gameID), name: gameName, rating: rating, releaseDate: gameRelease, backgroundImage: backgroundImage, description: "Lorem Ipsum", genres: [GameGenres(name: "Lorem")])
                gamesModel.append(gameModel)
            }
            completion(.success(gamesModel))
        } catch {
            completion(.failure(error))
        }
    }
    
    
    func addGameFavorite(with game: GameModel, completion: @escaping (Bool) -> Void) {
        let gameObj = NSManagedObject(entity: self.gameEntity, insertInto: self.context)
        gameObj.setValue(game.id, forKeyPath: "gameID")
        gameObj.setValue(game.name, forKeyPath: "name")
        gameObj.setValue(game.backgroundImage, forKeyPath: "backgroundImage")
        gameObj.setValue(game.releaseDate, forKeyPath: "releaseDate")
        gameObj.setValue(game.rating, forKeyPath: "rating")
        do {
            try context.save()
            completion(true)
        } catch {
            print("Error saving movie: \(error)")
            completion(false)
        }
    }
    
    func deleteGameFavorite(with game: GameModel, completion: @escaping (Bool) -> Void) {
        let fetchRequest: NSFetchRequest<Game> = Game.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "gameID = \(game.id)")
        do {
            let games = try context.fetch(fetchRequest)
            for game in games {
                context.delete(game)
            }
            try context.save()
            completion(true)
        } catch {
            completion(true)
        }
    }
    
    func getGameWithID(withID id: Int, completion: @escaping (Bool) -> Void) {
        let fetchRequest: NSFetchRequest<Game> = Game.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "gameID = \(id)")
        do {
            let game = try context.fetch(fetchRequest).count
            if game > 0 {
                completion(true)
            }else{
                completion(false)
            }
        } catch {
            print("Error fetch check movie: \(error)")
        }
    }
    
}
