//
//  DatabaseManager.swift
//  Brasileirao
//
//  Created by Vitor Maura on 03/10/20.
//

import Foundation
import CoreData

class DatabaseManager: DatabaseManagerInput {
    // MARK: - FUNCTIONS -
    public func getObject<T: NSManagedObject>() -> T? {
        let entityName = String(describing: T.self)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        guard let result = try? MainDatabase.shared.context.fetch(fetchRequest),
              let object = result.first as? T
              else { return nil }
        return object
    }
    
    public func getObject<T: NSManagedObject>(with id: String) -> T? {
        let entityName = String(describing: T.self)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        guard let result = try? MainDatabase.shared.context.fetch(fetchRequest),
              let object = result.first as? T
              else { return nil }
        return object
    }

    
    public func delete<T: NSManagedObject>(object: T) {
        MainDatabase.shared.context.delete(object)
        MainDatabase.shared.saveContext()
    }
    
    public func getInstance<T: NSManagedObject>() -> T? {
        let instance = T(context: MainDatabase.shared.context)
        return instance
    }
}
