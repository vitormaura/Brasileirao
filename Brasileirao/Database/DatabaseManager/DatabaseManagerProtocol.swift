//
//  DatabaseManagerProtocol.swift
//  Brasileirao
//
//  Created by Vitor Maura on 03/10/20.
//

import Foundation
import CoreData

public protocol DatabaseManagerInput: class {
    //MARK: - FUNCTIONS -
    func getObject<T: NSManagedObject>() -> T?
    func getObject<T: NSManagedObject>(with id: String) -> T?
    func delete<T: NSManagedObject>(object: T)
    func getInstance<T: NSManagedObject>() -> T?
}
