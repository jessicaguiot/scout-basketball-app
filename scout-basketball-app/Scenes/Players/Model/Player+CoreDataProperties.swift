//
//  Player+CoreDataProperties.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 16/02/21.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var isFirstString: Bool
    @NSManaged public var name: String?
    @NSManaged public var numeration: Int64
    @NSManaged public var position: String?

}

extension Player : Identifiable {

}
