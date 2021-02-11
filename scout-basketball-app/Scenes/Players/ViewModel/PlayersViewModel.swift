//
//  PlayersViewModel.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 09/02/21.
//

import Foundation
import UIKit
import CoreData

class PlayersViewModel {
    
    static let context = AppDelegate.viewContext
    
    var players: [Player]?
    
    func save(context: NSManagedObjectContext = context) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Save error \(error)")
            }
        }
    }
    
    
    //MARK: - CRUD: Core Data
    
    func fetchAllPlayers(viewContext: NSManagedObjectContext = context) -> [Player] {
        return Player.fetchAllPlayers(viewContext: viewContext)
    }
    
    func createPlayer(name: String, isFirstString: Bool, numeration: Int, position: String, viewContext: NSManagedObjectContext = context) -> Player? {
        
        guard let newPlayer = NSEntityDescription.insertNewObject(forEntityName:"Player", into: viewContext) as? Player else {
            return nil
        }
        
        newPlayer.name = name
        newPlayer.isFirstString = isFirstString
        newPlayer.numeration = Int64(numeration)
        newPlayer.position = position
        save(context: viewContext)
        return newPlayer
    }
    
    func deletePlayer(player playerToDelete: Player, viewContext: NSManagedObjectContext = context) {
        
        players = Player.fetchAllPlayers(viewContext: viewContext)
        
        for player in players! {
            
            if player == playerToDelete {
                
                viewContext.delete(player)
                save(context: viewContext)
            }
        }
    }
}
