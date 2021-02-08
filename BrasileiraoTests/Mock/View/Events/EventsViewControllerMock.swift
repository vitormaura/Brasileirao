//
//  EventsViewControllerMock.swift
//  BrasileiraoTests
//
//  Created by Vitor Maura on 06/10/20.
//

import Foundation
@testable import Brasileirao

class EventsViewControllerMock: EventsPresenterOutput {
    //MARK: - VARIABLES -
    var viewData: EventsViewData?
    lazy var loadingMessage = "loading"
    lazy var isError = false
    
}

//MARK: - FUNCTIONS -
extension EventsViewControllerMock {
    func startLoading() {
        self.loadingMessage = "loading"
    }
    
    func stopLoading() {
        self.loadingMessage = "loaded"
    }
    
    func setViewData(viewData: EventsViewData) {
        self.viewData = viewData
    }
    
    func setViewDataFromDB(viewData: EventsViewData) {
        //
    }
    
    func setError() {
        self.isError = true
    }
}
