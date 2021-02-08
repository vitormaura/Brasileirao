//
//  EventsViewControllerTests.swift
//  BrasileiraoTests
//
//  Created by Vitor Maura on 06/10/20.
//

import Foundation
import XCTest

class EventsViewControllerTests: XCTestCase {
    //MARK: - FUNCTIONS -
    func testSuccessViewController() {
        let viewController = self.setMockViewController(fileName: "eventsSuccess")
        XCTAssertEqual(viewController.loadingMessage, "loaded")
        XCTAssertNotNil(viewController.viewData)
        XCTAssertFalse(viewController.isError)
    }
    
    func testErrorViewController() {
        let viewController = self.setMockViewController(fileName: "eventsError")
        XCTAssertEqual(viewController.loadingMessage, "loaded")
        XCTAssertNil(viewController.viewData)
        XCTAssertTrue(viewController.isError)
    }
    
    func testEmptyEvents() {
        let viewController = self.setMockViewController(fileName: "emptyEvents")
        XCTAssertEqual(viewController.loadingMessage, "loaded")
        XCTAssertNil(viewController.viewData)
        XCTAssertTrue(viewController.isError)
    }
}

//MARK: - AUX FUNCTIONS -
extension EventsViewControllerTests {
    private func setMockViewController(fileName: String) -> EventsViewControllerMock {
        let service = EventsServiceMock(fileName: fileName)
        let interactor = EventsInteractorMock(service: service)
        let presenter = EventsPresenterMock(eventsInteractor: interactor)
        let viewController = EventsViewControllerMock()
        interactor.output = presenter
        presenter.output = viewController
        presenter.getEvents()
        return viewController
    }
}

