//
//  RoundPresenterMock.swift
//  BrasileiraoTests
//
//  Created by Vitor Maura on 06/10/20.
//

import Foundation
@testable import Brasileirao

class RoundPresenterMock: RoundPresenterInput {
    //MARK: - VARIABLES -
    weak var output: RoundPresenterOutput?
    var roundInteractor: RoundInteractorInput
    var viewData: RoundViewData?
    var response: RoundResponse?
    
    //MARK: - INIT -
    init(roundInteractor: RoundInteractorInput) {
        self.roundInteractor = roundInteractor
    }
    
    //MARK: - FUNCTIONS -
    func getRound() {
        self.output?.startLoading()
        self.roundInteractor.getRound()
    }
}

//MARK: - INTERACTOR OUTPUT -
extension RoundPresenterMock: RoundInteractorOutput {
    func handleRoundSuccess(response: RoundResponse) {
        self.viewData = RoundViewData(response: response)
        self.response = response
        self.output?.stopLoading()
        guard let viewData = self.viewData else { return }
        self.output?.setViewData(viewData: viewData)
    }
    
    func handleRoundSuccessFromDB(response: RoundResponse) {
        //
    }
    
    func handleRoundError() {
        self.viewData = nil
        self.response = nil
        self.output?.stopLoading()
        self.output?.setError()
    }
}
