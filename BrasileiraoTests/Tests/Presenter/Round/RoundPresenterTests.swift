//
//  RoundPresenterTests.swift
//  BrasileiraoTests
//
//  Created by Vitor Maura on 06/10/20.
//

import Foundation
@testable import Brasileirao
import XCTest

class RoundPresenterTests: XCTestCase {
    //MARK: - FUNCTIONS -
    func testSuccessViewDataCreation() {
        let presenter = setMockPresenter(fileName: "roundSuccess")
        XCTAssertNotNil(presenter.viewData)
    }
    
    func testSuccessViewDataErrorCreation() {
        let presenter = setMockPresenter(fileName: "roundError")
        XCTAssertNil(presenter.viewData)
    }
    
    func testMatchViewDataEmpty() {
        let presenter = setMockPresenter(fileName: "emptyRound")
        XCTAssertNil(presenter.viewData)
    }
    
    func testViewDataMapper() {
        let presenter = setMockPresenter(fileName: "roundSuccess")
        XCTAssertNotNil(presenter.viewData)
        XCTAssertNotNil(presenter.response)
        presenter.response?.matches.enumerated().forEach({
            XCTAssertTrue($1.matchId == presenter.viewData?.matches[$0].matchId)
            XCTAssertTrue($1.eventDate.timestampToString == presenter.viewData?.matches[$0].eventDate)
            XCTAssertTrue($1.homeTeamName.teamName.removeAccents == presenter.viewData?.matches[$0].homeTeamName)
            XCTAssertTrue(String($1.goalsHomeTeam) == presenter.viewData?.matches[$0].homeTeamScore)
            XCTAssertTrue($1.homeTeamLogoUrl == presenter.viewData?.matches[$0].homeTeamLogoUrl)
            XCTAssertTrue($1.awayTeamName.teamName.removeAccents == presenter.viewData?.matches[$0].awayTeamName)
            XCTAssertTrue(String($1.goalsAwayTeam) == presenter.viewData?.matches[$0].awayTeamScore)
            XCTAssertTrue($1.awayTeamLogoUrl == presenter.viewData?.matches[$0].awayTeamLogoUrl)
            XCTAssertTrue($1.venue == presenter.viewData?.matches[$0].venue)
        })
    }
}

//MARK: - AUX FUNCTIONS -
extension RoundPresenterTests {
    private func setMockPresenter(fileName: String) -> RoundPresenterMock {
        let service = RoundServiceMock(fileName: fileName)
        let interactor = RoundInteractorMock(service: service)
        let presenter = RoundPresenterMock(roundInteractor: interactor)
        interactor.output = presenter
        presenter.getRound()
        return presenter
    }
}

