//
//  ServiceManagerMock.swift
//  BrasileiraoTests
//
//  Created by Vitor Maura on 06/10/20.
//

import Foundation
@testable import Brasileirao

class ServiceManagerMock: ServiceManagerInput {
    //MARK: - VARIABLES -
    var fileName: String
    
    //MARK: - INIT -
    init(fileName: String) {
        self.fileName = fileName
    }
}

//MARK: - FUNCTIONS -
extension ServiceManagerMock {
    func get(url: String = "", completion: @escaping (Result<Data, ServiceError>) -> ()) {
        guard let pathUrl = Bundle(for: type(of: self)).url(forResource: self.fileName, withExtension: "json") else { completion(.failure(.urlError)) ; return }
        do {
            let data = try Data(contentsOf: pathUrl)
            completion(.success(data))
        } catch {
            completion(.failure(.requestError))
        }
    }
}
