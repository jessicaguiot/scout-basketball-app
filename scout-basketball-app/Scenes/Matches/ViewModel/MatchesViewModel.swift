//
//  MatchesViewModel.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 09/02/21.
//

import Foundation
import UIKit
import CoreData

class MatchesViewModel {
    
    static let context = AppDelegate.viewContext
    
    var matches: [Match]?
    
    func save(context: NSManagedObjectContext = context) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Save error \(error)")
            }
        }
    }
    
    //MARK: - CRUD Core Data
    
    func fetchAllPlayers(viewContext: NSManagedObjectContext = context) -> [Match] {
        return Match.fetchAllMatches(viewContext: viewContext)
    }
    
    func createMatch(opponentName: String, opponentPoints: Int, userPoints:Int, viewContext: NSManagedObjectContext = context) -> Match? {
        
        guard let newMatch = NSEntityDescription.insertNewObject(forEntityName: "Match", into: viewContext) as? Match else {
            return nil
        }
        
        newMatch.opponentTeamName = opponentName
        newMatch.opponentPoints = Int64(opponentPoints)
        newMatch.userTeamPoints = Int64(userPoints)
        
        save(context: viewContext)
        return newMatch
    }
    
    func deleteMatch(match matchToDelete: Match, viewContext: NSManagedObjectContext = context) {
        
        matches = Match.fetchAllMatches(viewContext: viewContext)
        
        for match in matches! {
            
            if match == matchToDelete {
                
                viewContext.delete(match)
                save(context: viewContext)
            }
        }
    }
    
}
