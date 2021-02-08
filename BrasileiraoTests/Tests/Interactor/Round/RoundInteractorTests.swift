//
//  RoundInteractorTests.swift
//  BrasileiraoTests
//
//  Created by Vitor Maura on 06/10/20.
//


import Foundation
@testable import Brasileirao
import XCTest

class RoundInteractorTests: XCTestCase {
    //MARK: - FUNCTIONS -
    func testEntitySerialization() {
        let interactor = setMockInteractor(fileName: "roundSuccess")
        XCTAssertNotNil(interactor.entity)
    }
    
    func testEntityErrorSerialization() {
        let interactor = setMockInteractor(fileName: "roundError")
        XCTAssertNil(interactor.entity)
    }
    
    func testResponseCreation() {
        let interactor = setMockInteractor(fileName: "roundSuccess")
        XCTAssertNotNil(interactor.response)
    }
    
    func testResponseErrorCreation() {
        let interactor = setMockInteractor(fileName: "roundError")
        XCTAssertNil(interactor.response)
    }
    
    func testEmptyMatchesRound() {
        let interactor = setMockInteractor(fileName: "emptyRound")
        XCTAssertNotNil(interactor.entity)
        XCTAssertNil(interactor.response)
    }
    
    func testResponseNotNil() {
        let interactor = setMockInteractor(fileName: "roundSuccess")
        XCTAssertNotNil(interactor.response)
        interactor.response?.matches.forEach({
            XCTAssertNotNil($0.matchId)
            XCTAssertNotNil($0.homeTeamName)
            XCTAssertNotNil($0.homeTeamLogoUrl)
            XCTAssertNotNil($0.goalsHomeTeam)
            XCTAssertNotNil($0.awayTeamName)
            XCTAssertNotNil($0.awayTeamLogoUrl)
            XCTAssertNotNil($0.goalsAwayTeam)
            XCTAssertNotNil($0.eventDate)
            XCTAssertNotNil($0.venue)
        })
    }
    
    func testResponseBusinessRules() {
        let interactor = setMockInteractor(fileName: "roundSuccess")
        XCTAssertNotNil(interactor.response)
        interactor.response?.matches.forEach({
            XCTAssertTrue(!$0.homeTeamName.isEmpty)
            XCTAssertTrue(!$0.homeTeamLogoUrl.isEmpty)
            XCTAssertTrue(!$0.awayTeamName.isEmpty)
            XCTAssertTrue(!$0.awayTeamLogoUrl.isEmpty)
            XCTAssertTrue($0.eventDate != 0)
        })
    }
    
    func testResponseMapper() {
        let interactor = setMockInteractor(fileName: "roundSuccess")
        XCTAssertNotNil(interactor.response)
        XCTAssertTrue(interactor.entity?.matches?.count == interactor.response?.matches.count)
        interactor.response?.matches.enumerated().forEach({
            XCTAssertTrue($1.matchId == interactor.entity?.matches?[$0].match_id)
            XCTAssertTrue($1.homeTeamName == interactor.entity?.matches?[$0].homeTeam?.team_name)
            XCTAssertTrue($1.homeTeamLogoUrl == interactor.entity?.matches?[$0].homeTeam?.logo)
            XCTAssertTrue($1.goalsHomeTeam == interactor.entity?.matches?[$0].goalsHomeTeam)
            XCTAssertTrue($1.awayTeamName == interactor.entity?.matches?[$0].awayTeam?.team_name)
            XCTAssertTrue($1.awayTeamLogoUrl == interactor.entity?.matches?[$0].awayTeam?.logo)
            XCTAssertTrue($1.goalsAwayTeam == interactor.entity?.matches?[$0].goalsAwayTeam)
            XCTAssertTrue($1.eventDate == Double(interactor.entity?.matches?[$0].event_timestamp ?? 0))
            XCTAssertTrue($1.venue == interactor.entity?.matches?[$0].venue)
        })
    }
}

//MARK: - AUX FUNCTIONS -
extension RoundInteractorTests {
    private func setMockInteractor(fileName: String) -> RoundInteractorMock {
        let service = RoundServiceMock(fileName: fileName)
        let interactor = RoundInteractorMock(service: service)
        interactor.getRound()
        return interactor
    }
}
