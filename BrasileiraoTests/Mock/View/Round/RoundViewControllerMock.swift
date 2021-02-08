//
//  RoundViewControllerMock.swift
//  BrasileiraoTests
//
//  Created by Vitor Maura on 06/10/20.
//

import Foundation
@testable import Brasileirao

class RoundViewControllerMock: RoundPresenterOutput {
    //MARK: - VARIABLES -
    var viewData: RoundViewData?
    lazy var loadingMessage = "loading"
    lazy var isError = false
    
}

//MARK: - FUNCTIONS -
extension RoundViewControllerMock {
    func startLoading() {
        self.loadingMessage = "loading"
    }
    
    func stopLoading() {
        self.loadingMessage = "loaded"
    }
    
    func setViewData(viewData: RoundViewData) {
        self.viewData = viewData
    }
    
    func setViewDataFromDB(viewData: RoundViewData) {
        //
    }
    
    func setError() {
        self.isError = true
    }
}
