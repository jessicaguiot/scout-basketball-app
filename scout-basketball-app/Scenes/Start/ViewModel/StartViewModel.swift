//
//  File.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 09/02/21.
//

import Foundation
import CoreData
import UIKit

class StartViewModel {
    
    static let context = AppDelegate.viewContext
    
    var team: [UserTeam]?
    
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
    
    func fetchAllTeams(viewContext: NSManagedObjectContext = context) -> [UserTeam] {
        return UserTeam.fetchTeamName(viewContext: viewContext)
    }
    
    
    func getLastTeamName(viewContext: NSManagedObjectContext = context) -> String {
        
        let team = fetchAllTeams(viewContext: viewContext)
        return team.last?.name ?? "theres no team here"
    }
    
    func createTeam(teamName: String, viewContext: NSManagedObjectContext = context) -> UserTeam? {
        
        guard let newTeam = NSEntityDescription.insertNewObject(forEntityName:"UserTeam", into: viewContext) as? UserTeam else {
            return nil
        }
        
        newTeam.name = teamName
        save(context: viewContext)
        return newTeam
    }
}


