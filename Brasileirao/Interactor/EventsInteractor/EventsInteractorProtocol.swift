//
//  EventsInteractorProtocol.swift
//  Brasileirao
//
//  Created by Vitor Maura on 05/10/20.
//

import Foundation

// MARK: - INTERACTOR INPUT PROTOCOL -
public protocol EventsInteractorInput: class {
    // MARK: - VARIABLES -
    var output: EventsInteractorOutput? { get set }
    var service: EventsServiceInput { get set }
    var dataBase: EventsDatabaseInput { get set }
    
    // MARK: - INPUT FUNCTIONS -
    func getEvents(matchId: String)
}

// MARK: - INTERACTOR OUTPUT PROTOCOL -
public protocol EventsInteractorOutput: class {
    
    // MARK: - OUTPUT FUNCTIONS -
    func handleRoundSuccess(response: EventsResponse)
    func handleRoundSuccessFromDB(response: EventsResponse)
    func handleRoundError()
}
