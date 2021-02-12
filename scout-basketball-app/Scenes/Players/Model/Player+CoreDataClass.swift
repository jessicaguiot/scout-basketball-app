//
//  Player+CoreDataClass.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 11/02/21.
//
//

import Foundation
import CoreData
import UIKit

@objc(Player)
public class Player: NSManagedObject {
    
    
    static func fetchAllPlayers(viewContext: NSManagedObjectContext = AppDelegate.viewContext) -> [Player] {
        
        let request: NSFetchRequest<Player> = Player.fetchRequest()
        guard let players = try? viewContext.fetch(request) else {
            return []
        }
        return players
    }
}
