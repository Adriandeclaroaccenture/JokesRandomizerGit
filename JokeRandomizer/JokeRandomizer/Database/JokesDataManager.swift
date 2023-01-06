//
//  JokesDataManager.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 12/7/22.
//

import Foundation
import CoreData

class JokesDataManager {
//MARK: - Property
    let container: NSPersistentContainer
    @Published var jokesData: [JokesDataList] = []
//MARK: - Init
    init() {
        container = NSPersistentContainer(name: "JokesData")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error Loading Data \(error)")
            }
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
//MARK: - Func Get all jokes
    func getAllJokes() {
        let request = NSFetchRequest<JokesDataList>(entityName: "JokesDataList")
        do {
            jokesData = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching joke \(error)")
        }
    }
//MARK: - Func addJoke
    func addJoke(setup: String, punch: String) {
        let newJoke = JokesDataList(context: container.viewContext)
        newJoke.setup = setup
        newJoke.punchline = punch
        
        saveData()
    }
//MARK: - Func deleteJokes
    func deleteJoke(item: JokesDataList) {
        container.viewContext.delete(item)
        
        saveData()
    }
//MARK: - Func saveData
    func saveData() {
        do {
            try container.viewContext.save()
            getAllJokes()
        } catch {
            
        }
    }
    
}
