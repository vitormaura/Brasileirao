//
//  EventsService.swift
//  Brasileirao
//
//  Created by Vitor Maura on 05/10/20.
//

import Foundation

class EventsService: BaseService {
    //MARK: - VARIABLES -
    lazy var serviceManager = ServiceManager(session: self.session)
    lazy var roundPath = "/events/"
}

//MARK: - FUNCTIONS -
extension EventsService: EventsServiceInput {
    func getEvents(matchId: String, completion: @escaping (Result<Data, ServiceError>) -> ()) {
        self.serviceUrl = self.host + self.version + self.roundPath + matchId
        self.serviceManager.get(url: self.serviceUrl) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

