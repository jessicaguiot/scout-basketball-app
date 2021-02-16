//
//  Match+CoreDataProperties.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 16/02/21.
//
//

import Foundation
import CoreData


extension Match {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Match> {
        return NSFetchRequest<Match>(entityName: "Match")
    }

    @NSManaged public var opponentPoints: Int64
    @NSManaged public var opponentTeamName: String?
    @NSManaged public var userTeamPoints: Int64

}

extension Match : Identifiable {

}
