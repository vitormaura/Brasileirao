//
//  EventsServiceProtocol.swift
//  Brasileirao
//
//  Created by Vitor Maura on 05/10/20.
//

import Foundation

public protocol EventsServiceInput: class {
    //MARK: - FUNCTIONS -
    func getEvents(matchId: String, completion: @escaping (Result<Data, ServiceError>) -> ())
}
