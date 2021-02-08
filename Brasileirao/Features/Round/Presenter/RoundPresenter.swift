//
//  RoundPresenter.swift
//  Brasileirao
//
//  Created by Vitor Maura on 01/10/20.
//

import Foundation

// MARK: - PRESENTER CLASS -
class RoundPresenter: RoundPresenterInput {
    // MARK: - VARIABLES -
    weak var output: RoundPresenterOutput?
    var roundInteractor: RoundInteractorInput
    
    // MARK: - INIT -
    init(output: RoundPresenterOutput,
         roundInteractor: RoundInteractorInput) {
        self.output = output
        self.roundInteractor = roundInteractor
    }
}

// MARK: - INPUT FUNCTIONS -
extension RoundPresenter {
    func getRound() {
        self.output?.startLoading()
        self.roundInteractor.getRound()
    }
}

// MARK: - OUTPUT FUNCTIONS -
extension RoundPresenter: RoundInteractorOutput {
    func handleRoundSuccess(response: RoundResponse) {
        self.output?.stopLoading()
        self.output?.setViewData(viewData: RoundViewData(response: response))
    }
    
    func handleRoundSuccessFromDB(response: RoundResponse) {
        self.output?.stopLoading()
        self.output?.setViewDataFromDB(viewData: RoundViewData(response: response))
    }
    
    func handleRoundError() {
        self.output?.setError()
    }
}
