//
//  CoreDataManager.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 11/29/22.
//

//import Foundation
//import CoreData
//
//final class CoreDataManager {
//    static let shared: CoreDataManager = CoreDataManager()
//   
//    var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//        
//    private lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "JokesDataModel")
//        container.loadPersistentStores { (_, error) in
//            if let error = error as NSError? {
//                fatalError("Unresolved Error \(error), \(error.userInfo)")
//            }
//        }
//        return container
//    }()
//    
//    
//    private init() {
//        managedObjectContext = self.persistentContainer.viewContext
//    }
//    
//    internal func saveContext() {
//        if managedObjectContext.hasChanges {
//            do {
//                try managedObjectContext.save()
//            } catch let err {
//                let error = err as NSError
//                fatalError("Unresolved Error \(error), \(error.userInfo)")
//            }
//        }
//    }
//}

