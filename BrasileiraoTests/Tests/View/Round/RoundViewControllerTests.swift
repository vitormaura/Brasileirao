//
//  RoundViewControllerTests.swift
//  BrasileiraoTests
//
//  Created by Vitor Maura on 06/10/20.
//

import Foundation
import XCTest

class RoundViewControllerTests: XCTestCase {
    //MARK: - FUNCTIONS -
    func testSuccessViewController() {
        let viewController = self.setMockViewController(fileName: "roundSuccess")
        XCTAssertEqual(viewController.loadingMessage, "loaded")
        XCTAssertNotNil(viewController.viewData)
        XCTAssertFalse(viewController.isError)
    }
    
    func testErrorViewController() {
        let viewController = self.setMockViewController(fileName: "roundError")
        XCTAssertEqual(viewController.loadingMessage, "loaded")
        XCTAssertNil(viewController.viewData)
        XCTAssertTrue(viewController.isError)
    }
    
    func testEmptyRound() {
        let viewController = self.setMockViewController(fileName: "emptyRound")
        XCTAssertEqual(viewController.loadingMessage, "loaded")
        XCTAssertNil(viewController.viewData)
        XCTAssertTrue(viewController.isError)
    }
}

//MARK: - AUX FUNCTIONS -
extension RoundViewControllerTests {
    private func setMockViewController(fileName: String) -> RoundViewControllerMock {
        let service = RoundServiceMock(fileName: fileName)
        let interactor = RoundInteractorMock(service: service)
        let presenter = RoundPresenterMock(roundInteractor: interactor)
        let viewController = RoundViewControllerMock()
        interactor.output = presenter
        presenter.output = viewController
        presenter.getRound()
        return viewController
    }
}
