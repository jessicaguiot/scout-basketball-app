//
//  UserTeam+CoreDataClass.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 11/02/21.
//
//

import Foundation
import CoreData
import UIKit

@objc(UserTeam)
public class UserTeam: NSManagedObject {
        
    static func fetchTeamName(viewContext: NSManagedObjectContext = AppDelegate.viewContext) -> [UserTeam] {
        
        let request: NSFetchRequest<UserTeam> = UserTeam.fetchRequest()
        
        guard let team = try? viewContext.fetch(request) else { return [] }
        
        return team
    }
}
