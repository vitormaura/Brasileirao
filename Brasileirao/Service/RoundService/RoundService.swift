//
//  RoundService.swift
//  Brasileirao
//
//  Created by Vitor Maura on 01/10/20.
//

import Foundation

class RoundService: BaseService {
    //MARK: - VARIABLES -
    lazy var serviceManager = ServiceManager(session: self.session)
    lazy var roundPath = "/round"
}

//MARK: - FUNCTIONS -
extension RoundService: RoundServiceInput {
    func getRound(completion: @escaping (Result<Data, ServiceError>) -> ()) {
        self.serviceUrl = self.host + self.version + self.roundPath
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
