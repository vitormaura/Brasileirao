//
//  EventsServiceMock.swift
//  BrasileiraoTests
//
//  Created by Vitor Maura on 06/10/20.
//

import Foundation
@testable import Brasileirao

class EventsServiceMock: EventsServiceInput {
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
extension EventsServiceMock {
    func getEvents(matchId: String = "",
                   completion: @escaping (Result<Data, ServiceError>) -> ()) {
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
