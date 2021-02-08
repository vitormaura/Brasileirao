//
//  EventsInteractorMock.swift
//  BrasileiraoTests
//
//  Created by Vitor Maura on 06/10/20.
//

import Foundation
@testable import Brasileirao

class EventsInteractorMock: EventsInteractorInput {
    //MARK: - VARIABLES -
    weak var output: EventsInteractorOutput?
    var service: EventsServiceInput
    var dataBase: EventsDatabaseInput
    var response: EventsResponse?
    var entity: EventEntity?
    
    //MARK: - INIT -
    init(service: EventsServiceInput, dataBase: EventsDatabaseInput = EventsDatabase()) {
        self.service = service
        self.dataBase = dataBase
    }
}

//MARK: - FUNCTIONS -
extension EventsInteractorMock {
    func getEvents(matchId: String = "") {
        self.service.getEvents(matchId: matchId) { result in
            switch result {
            case .success(let data):
                do {
                    let model = try JSONDecoder().decode(EventEntity.self, from: data)
                    guard model.events != nil, model.match_id != nil else {
                        self.output?.handleRoundError()
                        return
                    }
                    self.entity = model
                    self.response = EventsResponse(entity: model, refreshDate: Date())
                    guard let response = self.response else {
                        self.output?.handleRoundError()
                        return
                    }
                    self.output?.handleRoundSuccess(response: response)
                } catch {
                    self.entity = nil
                    self.response = nil
                    self.output?.handleRoundError()
                }
            case .failure(_):
                self.entity = nil
                self.response = nil
                self.output?.handleRoundError()
            }
        }
    }
}
