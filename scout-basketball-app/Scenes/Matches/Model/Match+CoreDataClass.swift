//
//  Match+CoreDataClass.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 11/02/21.
//
//

import Foundation
import CoreData
import UIKit

@objc(Match)
public class Match: NSManagedObject {
    
    static func fetchAllMatches(viewContext: NSManagedObjectContext = AppDelegate.viewContext) -> [Match] {
        
        let request: NSFetchRequest<Match> = Match.fetchRequest()
        
        guard let matches = try? viewContext.fetch(request) else {
            
            return []
        }
        return matches
    }
}
