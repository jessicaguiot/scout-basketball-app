//
//  UserTeam+CoreDataProperties.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 16/02/21.
//
//

import Foundation
import CoreData


extension UserTeam {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserTeam> {
        return NSFetchRequest<UserTeam>(entityName: "UserTeam")
    }

    @NSManaged public var name: String?

}

extension UserTeam : Identifiable {

}
