//
//  RoundServiceMock.swift
//  BrasileiraoTests
//
//  Created by Vitor Maura on 06/10/20.
//

import Foundation
@testable import Brasileirao

class RoundServiceMock: RoundServiceInput {
    //MARK: - VARIABLES -
    var fileName: String
    var serviceManager: ServiceManagerMock
    
    //MARK: - INIT -
    init(fileName: String) {
        self.fileName = fileName
        self.serviceManager = ServiceManagerMock(fileName: fileName)
    }

}

//MARK: - FUNCTIONS -
extension RoundServiceMock {
    func getRound(completion: @escaping (Result<Data, ServiceError>) -> ()) {
        self.serviceManager.get { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
