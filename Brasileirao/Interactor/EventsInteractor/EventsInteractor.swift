//
//  EventsInteractor.swift
//  Brasileirao
//
//  Created by Vitor Maura on 05/10/20.
//

import Foundation

// MARK: - INTERACTOR CLASS -
class EventsInteractor: EventsInteractorInput {
    // MARK: - VARIABLES -
    weak var output: EventsInteractorOutput?
    var service: EventsServiceInput
    var dataBase: EventsDatabaseInput
    
    // MARK: - INIT -
    init(service: EventsServiceInput, dataBase: EventsDatabaseInput) {
        self.service = service
        self.dataBase = dataBase
    }
}

// MARK: - FUNCTIONS -
extension EventsInteractor {
    func getEvents(matchId: String) {
        self.service.getEvents(matchId: matchId, completion: { [weak self] result in
            switch result {
            case .success(let data):
                self?.handleRoundValidation(data)
            case .failure(_):
                self?.handleRoundErrorValidation(matchId: matchId)
            }
        })
    }
}
    
// MARK: - AUX FUNCTIONS -
extension EventsInteractor {
    private func handleRoundValidation(_ data: Data) {
        guard let response = self.createAndValidateResponse(with: data)
              else { self.output?.handleRoundError() ; return }
        self.dataBase.createOrUpdate(with: data, and: String(response.matchId))
        self.output?.handleRoundSuccess(response: response)
    }
    
    private func handleRoundErrorValidation(matchId: String) {
        guard let eventsData: EventsData = self.dataBase
                  .getEventsFromDatabase(matchId: matchId),
              let refreshDate = eventsData.refreshDate,
              let data = eventsData.data,
              let response = createAndValidateResponse(with: data, and: refreshDate)
              else { self.output?.handleRoundError() ; return }
        self.output?.handleRoundSuccessFromDB(response: response)
    }
}

// MARK: - BUSINESS RULES -
extension EventsInteractor {
    private func createAndValidateResponse(with data: Data,
                                           and refreshDate: Date = Date()) -> EventsResponse? {
        guard let entity = try? JSONDecoder().decode(EventEntity.self, from: data)
              else { return nil }
        return EventsResponse(entity: entity, refreshDate: refreshDate)
    }
}
