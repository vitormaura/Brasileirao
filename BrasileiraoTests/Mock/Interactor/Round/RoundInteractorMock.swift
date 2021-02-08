//
//  RoundInteractorMock.swift
//  BrasileiraoTests
//
//  Created by Vitor Maura on 06/10/20.
//

import Foundation
@testable import Brasileirao

class RoundInteractorMock: RoundInteractorInput {
    //MARK: - VARIABLES -
    weak var output: RoundInteractorOutput?
    var service: RoundServiceInput
    var dataBase: RoundDatabaseInput
    var response: RoundResponse?
    var entity: RoundEntity?
    
    //MARK: - INIT -
    init(service: RoundServiceInput, dataBase: RoundDatabaseInput = RoundDatabase()) {
        self.service = service
        self.dataBase = dataBase
    }
}

//MARK: - FUNCTIONS -
extension RoundInteractorMock {
    func getRound() {
        self.service.getRound { result in
            switch result {
            case .success(let data):
                do {
                    let model = try JSONDecoder().decode(RoundEntity.self, from: data)
                    guard model.matches != nil, model.round_id != nil else {
                        self.output?.handleRoundError()
                        return
                    }
                    self.entity = model
                    self.response = RoundResponse(entity: model, refreshDate: Date())
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
