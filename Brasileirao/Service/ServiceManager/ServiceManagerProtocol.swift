//
//  ServiceManagerProtocol.swift
//  Brasileirao
//
//  Created by Vitor Maura on 01/10/20.
//

import Foundation

public protocol ServiceManagerInput: class {
    //MARK: - FUNCTIONS -
    func get(url: String, completion: @escaping (Result<Data, ServiceError>) -> ())
}
