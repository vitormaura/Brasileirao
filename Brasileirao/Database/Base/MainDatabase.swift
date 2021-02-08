//
//  MainDatabase.swift
//  Brasileirao
//
//  Created by Vitor Maura on 01/10/20.
//


import CoreData

class MainDatabase {
    // MARK: - SINGLETON -
    static let shared = MainDatabase()
    
    // MARK: - PRIVATE INIT -
    private init() {}
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Brasileirao")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.undoManager = nil
        container.viewContext.shouldDeleteInaccessibleFaults = true
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()
    
    lazy var context: NSManagedObjectContext = {
        return self.persistentContainer.viewContext
    }()
}

// MARK: - CODE DATA SAVING SUPPORT -
extension MainDatabase {
    func saveContext () {
        let context = self.persistentContainer.viewContext
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            print("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
