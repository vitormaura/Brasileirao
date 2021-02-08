//
//  EventsPresenterProtocol.swift
//  Brasileirao
//
//  Created by Vitor Maura on 05/10/20.
//

import Foundation

// MARK: - PRESENTER INPUT PROTOCOL -
public protocol EventsPresenterInput: class {
    // MARK: - VARIABLES -
    var output: EventsPresenterOutput? { get }
    var eventsInteractor: EventsInteractorInput { get }
    
    // MARK: - INPUT FUNCTIONS -
    func getEvents(matchId: String)
}

// MARK: - PRESENTER OUTPUT PROTOCOL -
public protocol EventsPresenterOutput: class {
    
    // MARK: - OUTPUT FUNCTIONS -
    func startLoading()
    func stopLoading()
    func setViewData(viewData: EventsViewData)
    func setViewDataFromDB(viewData: EventsViewData)
    func setError()
}

