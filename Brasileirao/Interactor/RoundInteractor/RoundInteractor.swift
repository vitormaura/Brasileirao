//
//  RoundInteractor.swift
//  Brasileirao
//
//  Created by Vitor Maura on 01/10/20.
//

import Foundation

// MARK: - INTERACTOR CLASS -
class RoundInteractor: RoundInteractorInput {
    // MARK: - VARIABLES -
    weak var output: RoundInteractorOutput?
    var service: RoundServiceInput
    var dataBase: RoundDatabaseInput
    
    // MARK: - INIT -
    init(service: RoundServiceInput, dataBase: RoundDatabaseInput) {
        self.service = service
        self.dataBase = dataBase
    }
}

// MARK: - FUNCTIONS -
extension RoundInteractor {
    func getRound() {
        self.service.getRound() { [weak self] result in
            switch result {
            case .success(let data):
                self?.handleRoundValidation(data)
            case .failure(_):
                self?.handleRoundErrorValidation()
            }
        }
    }
}

// MARK: - AUX FUNCTIONS -
extension RoundInteractor {
    private func handleRoundValidation(_ data: Data) {
        guard let response = self.createAndValidateResponse(with: data)
              else { self.output?.handleRoundError() ; return }
        self.dataBase.createOrUpdate(with: data)
        self.output?.handleRoundSuccess(response: response)
    }
    
    private func handleRoundErrorValidation() {
        guard let roundData: RoundData = self.dataBase.getRoundFromDatabase(),
              let refreshDate = roundData.refreshDate,
              let data = roundData.data,
              let response = createAndValidateResponse(with: data, and: refreshDate)
              else { self.output?.handleRoundError() ; return  }
        self.output?.handleRoundSuccessFromDB(response: response)
    }
    
}

// MARK: - BUSINESS RULES -
extension RoundInteractor {
    private func createAndValidateResponse(with data: Data,
                                           and refreshDate: Date = Date()) -> RoundResponse? {
        guard let entity = try? JSONDecoder().decode(RoundEntity.self, from: data)
              else { return nil }
        return RoundResponse(entity: entity, refreshDate: refreshDate)
    }
}
