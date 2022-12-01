//
//  JokeListItemProperties.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 12/1/22.
//

import Foundation
import CoreData

//MARK: - Extenstion JokeListItem
extension JokeListItem {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<JokeListItem> {
        return NSFetchRequest<JokeListItem>(entityName: "JokeListItem")
    }
    @NSManaged public var setup: String?
    @NSManaged public var punchline: String?
}
//MARK: - Extension
extension JokeListItem: Identifiable {
    
}
