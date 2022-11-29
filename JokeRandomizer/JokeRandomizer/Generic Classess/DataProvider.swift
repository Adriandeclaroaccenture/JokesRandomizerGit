//
//  DataProvider.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 11/29/22.
//

import Foundation
import CoreData

protocol DataProviderDelegate: class {
    func didInsertItem(at indexPath: IndexPath)
    func didDeleteItem(at indexPath: IndexPath)
}
//MARK: - Class Data Provider
final class DataProvider<T: NSManagedObject>: NSObject, NSFetchedResultsControllerDelegate {
    
    weak var delegate: DataProviderDelegate?
    private var managedObjectContext: NSManagedObjectContext
    private var sortDescriptors: [NSSortDescriptor]
    private var predicate: NSPredicate?
//MARK: - Func Request
    private lazy var request: NSFetchRequest<T> = {
        let request = NSFetchRequest<T>(entityName: String(describing: T.self))
        request.sortDescriptors = sortDescriptors
        if let predicate = predicate {
            request.predicate = predicate
        }
        return request
    }()
//MARK: - Fetch Request Controller
    private lazy var fetchedResultsController: NSFetchedResultsController<T> = {
        let fetchedResult = NSFetchedResultsController<T>(fetchRequest: request, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResult.delegate = self
        return fetchedResult
        
    }()
//MARK: - init managedObjectContext
    init(managedObjectContext: NSManagedObjectContext, sortDescriptors: [NSSortDescriptor], predicate: NSPredicate? = nil) {
        
        self.managedObjectContext = managedObjectContext
        self.sortDescriptors = sortDescriptors
        self.predicate = predicate
        
        super.init()
        performFetch()
    }
//MARK: - Func performFetch
    func performFetch() {
        do {
            try fetchedResultsController.performFetch()
        } catch let err {
            print(err.localizedDescription)
        }
    }
//MARK: - Func objectIndex
    func objectAtIndex(indexPath: IndexPath) -> T {
        return fetchedResultsController.object(at: indexPath)
    }
//MARK: - Func rowsInSection
    func rowsInSection(section: Int) -> Int {
        return fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }
//MARK: - Func numberOfSections
    func numberOfSection() -> Int {
        return fetchedResultsController.sections?.count ?? 1
    }
//MARK: - Func deleteItem
    func deleItem(at indexPath: IndexPath) {
        let item = objectAtIndex(indexPath: indexPath)
        managedObjectContext.delete(item)
        do {
            try managedObjectContext.save()
        } catch let err {
            print(err.localizedDescription)
        }
    }
//MARK: - Func Controller
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        if type == .insert {
            if let idxPath = newIndexPath {
                delegate?.didInsertItem(at: idxPath)
            }
        } else if type == .delete {
            if let idxPath = indexPath {
                delegate?.didDeleteItem(at: idxPath)
            }
        }
    }
}
