//
//  EventsPresenterMock.swift
//  BrasileiraoTests
//
//  Created by Vitor Maura on 06/10/20.
//

import Foundation
@testable import Brasileirao

class EventsPresenterMock: EventsPresenterInput {
    //MARK: - VARIABLES -
    weak var output: EventsPresenterOutput?
    var eventsInteractor: EventsInteractorInput
    var viewData: EventsViewData?
    var response: EventsResponse?
    
    //MARK: - INIT -
    init(eventsInteractor: EventsInteractorInput) {
       self.eventsInteractor = eventsInteractor
    }
    
    //MARK: - FUNCTIONS -
    func getEvents(matchId: String = "") {
        self.output?.startLoading()
        self.eventsInteractor.getEvents(matchId: matchId)
    }
}

//MARK: - INTERACTOR OUTPUT -
extension EventsPresenterMock: EventsInteractorOutput {
    func handleRoundSuccess(response: EventsResponse) {
        self.viewData = EventsViewData(response: response)
        self.response = response
        self.output?.stopLoading()
        guard let viewData = self.viewData else { return }
        self.output?.setViewData(viewData: viewData)
    }
    
    func handleRoundSuccessFromDB(response: EventsResponse) {
        //
    }
    
    func handleRoundError() {
        self.viewData = nil
        self.response = nil
        self.output?.stopLoading()
        self.output?.setError()
    }
}
