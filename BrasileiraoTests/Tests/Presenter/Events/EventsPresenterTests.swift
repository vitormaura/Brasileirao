//
//  EventsPresenterTests.swift
//  BrasileiraoTests
//
//  Created by Vitor Maura on 06/10/20.
//

import Foundation
@testable import Brasileirao
import XCTest

class EventsPresenterTests: XCTestCase {
    //MARK: - FUNCTIONS -
    func testSuccessViewDataCreation() {
        let presenter = setMockPresenter(fileName: "eventsSuccess")
        XCTAssertNotNil(presenter.viewData)
    }
    
    func testSuccessViewDataErrorCreation() {
        let presenter = setMockPresenter(fileName: "eventsError")
        XCTAssertNil(presenter.viewData)
    }
    
    func testEventsViewDataEmpty() {
        let presenter = setMockPresenter(fileName: "emptyEvents")
        XCTAssertNil(presenter.viewData)
    }
    
    func testViewDataMapper() {
        let presenter = setMockPresenter(fileName: "eventsSuccess")
        XCTAssertNotNil(presenter.viewData)
        XCTAssertNotNil(presenter.response)
        XCTAssertTrue(presenter.viewData?.events.count == presenter.response?.events.count)
        let sortedResponseEvents = presenter.response?.events.sorted(by: { $0.elapsed + $0.elapsedPlus > $1.elapsed + $1.elapsedPlus })
        sortedResponseEvents?.enumerated().forEach({
            XCTAssertTrue("\($1.elapsed + $1.elapsedPlus)'" == presenter.viewData?.events[$0].elapsedTime)
            XCTAssertTrue($1.type == presenter.viewData?.events[$0].detailImageName)
            XCTAssertTrue($1.teamLogo == presenter.viewData?.events[$0].teamLogoUrl)
            XCTAssertTrue($1.detail.uppercased() == presenter.viewData?.events[$0].eventTitle)
            XCTAssertTrue(self.getEventDetail(response: $1) == presenter.viewData?.events[$0].eventDetail)
        })
    }
}

//MARK: - AUX FUNCTIONS -
extension EventsPresenterTests {
    private func setMockPresenter(fileName: String) -> EventsPresenterMock {
        let service = EventsServiceMock(fileName: fileName)
        let interactor = EventsInteractorMock(service: service)
        let presenter = EventsPresenterMock(eventsInteractor: interactor)
        interactor.output = presenter
        presenter.getEvents()
        return presenter
    }
    
    private func getEventDetail(response: EventsMatchResponse) -> String {
        switch response.type.lowercased() {
        case "substitution":
            return "Entra: \(response.player)\nSai: \(response.assist)"
        default:
            return "\(response.player)\n\(response.comments)"
        }
    }
}


