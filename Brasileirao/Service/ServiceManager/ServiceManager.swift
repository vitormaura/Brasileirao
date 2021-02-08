//
//  ServiceManager.swift
//  Brasileirao
//
//  Created by Vitor Maura on 01/10/20.
//

import Foundation

//MARK: - ERROR ENUM -
public enum ServiceError: Error {
    case urlError
    case requestError
}

class ServiceManager {
    //MARK: - VARIABLES -
    var session: URLSession
    
    //MARK: - INIT -
    init(session: URLSession) {
        self.session = session
    }
}

//MARK: - PROTOCOL INPUT -
extension ServiceManager: ServiceManagerInput {
    //MARK: - FUNCTIONS -
    func get(url: String, completion: @escaping (Result<Data, ServiceError>) -> ()) {
        guard let url = URL(string: url) else { return completion(.failure(.urlError)) }
        var request = URLRequest(url: url,
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        request.httpMethod = "GET"
        let dataTask = self.session.dataTask(with: request) { data, response, error in
            guard error == nil else { completion(.failure(.requestError)) ; return }
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200
                  else { completion(.failure(.requestError)) ; return }
            DispatchQueue.main.async {
                completion(.success(data))
            }
        }
        dataTask.resume()
    }
}
