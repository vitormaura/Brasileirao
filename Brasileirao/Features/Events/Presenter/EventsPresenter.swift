//
//  EventsPresenter.swift
//  Brasileirao
//
//  Created by Vitor Maura on 05/10/20.
//

import Foundation

// MARK: - PRESENTER CLASS -
class EventsPresenter: EventsPresenterInput {
    // MARK: - VARIABLES -
    weak var output: EventsPresenterOutput?
    var eventsInteractor: EventsInteractorInput
    
    // MARK: - INIT -
    init(output: EventsPresenterOutput,
         eventsInteractor: EventsInteractorInput) {
        self.output = output
        self.eventsInteractor = eventsInteractor
    }
}

// MARK: - INPUT FUNCTIONS -
extension EventsPresenter {
    func getEvents(matchId: String) {
        self.output?.startLoading()
        self.eventsInteractor.getEvents(matchId: matchId)
    }
}

// MARK: - OUTPUT FUNCTIONS -
extension EventsPresenter: EventsInteractorOutput {
    func handleRoundSuccess(response: EventsResponse) {
        self.output?.stopLoading()
        self.output?.setViewData(viewData: EventsViewData(response: response))
    }
    
    func handleRoundSuccessFromDB(response: EventsResponse) {
        self.output?.stopLoading()
        self.output?.setViewDataFromDB(viewData: EventsViewData(response: response))
    }
    
    func handleRoundError() {
        self.output?.setError()
    }
}

