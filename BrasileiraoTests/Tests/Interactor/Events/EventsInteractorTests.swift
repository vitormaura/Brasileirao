//
//  EventsInteractorTests.swift
//  BrasileiraoTests
//
//  Created by Vitor Maura on 06/10/20.
//

import Foundation
@testable import Brasileirao
import XCTest

class EventsInteractorTests: XCTestCase {
    //MARK: - FUNCTIONS -
    func testEntitySerialization() {
        let interactor = setMockInteractor(fileName: "eventsSuccess")
        XCTAssertNotNil(interactor.entity)
    }
    
    func testEntityErrorSerialization() {
        let interactor = setMockInteractor(fileName: "eventsError")
        XCTAssertNil(interactor.entity)
    }
    
    func testResponseCreation() {
        let interactor = setMockInteractor(fileName: "eventsSuccess")
        XCTAssertNotNil(interactor.response)
    }
    
    func testResponseErrorCreation() {
        let interactor = setMockInteractor(fileName: "eventsError")
        XCTAssertNil(interactor.response)
    }
    
    func testEmptyEvents() {
        let interactor = setMockInteractor(fileName: "emptyEvents")
        XCTAssertNotNil(interactor.entity)
        XCTAssertNil(interactor.response)
    }
    
    func testResponseNotNil() {
        let interactor = setMockInteractor(fileName: "eventsSuccess")
        XCTAssertNotNil(interactor.response)
        interactor.response?.events.forEach({
            XCTAssertNotNil($0.elapsed)
            XCTAssertNotNil($0.elapsedPlus)
            XCTAssertNotNil($0.teamName)
            XCTAssertNotNil($0.teamLogo)
            XCTAssertNotNil($0.player)
            XCTAssertNotNil($0.assist)
            XCTAssertNotNil($0.type)
            XCTAssertNotNil($0.detail)
            XCTAssertNotNil($0.comments)
        })
    }
    
    func testResponseBusinessRules() {
        let interactor = setMockInteractor(fileName: "eventsSuccess")
        XCTAssertNotNil(interactor.response)
        interactor.response?.events.forEach({
            XCTAssertTrue(!$0.teamName.isEmpty)
            XCTAssertTrue(!$0.teamLogo.isEmpty)
            XCTAssertTrue(!$0.player.isEmpty)
            XCTAssertTrue(!$0.type.isEmpty)
            XCTAssertTrue(!$0.detail.isEmpty)
        })
    }
    
    func testResponseMapper() {
        let interactor = setMockInteractor(fileName: "eventsSuccess")
        XCTAssertNotNil(interactor.response)
        XCTAssertTrue(interactor.entity?.events?.count == interactor.response?.events.count)
        interactor.response?.events.enumerated().forEach({
            XCTAssertTrue($1.elapsed == interactor.entity?.events?[$0].elapsed)
            XCTAssertTrue($1.elapsedPlus == interactor.entity?.events?[$0].elapsed_plus)
            XCTAssertTrue($1.teamName == interactor.entity?.events?[$0].teamName)
            XCTAssertTrue($1.teamLogo == interactor.entity?.events?[$0].logo)
            XCTAssertTrue($1.player == interactor.entity?.events?[$0].player)
            XCTAssertTrue($1.assist == interactor.entity?.events?[$0].assist)
            XCTAssertTrue($1.type == interactor.entity?.events?[$0].type)
            XCTAssertTrue($1.detail == interactor.entity?.events?[$0].detail)
            XCTAssertTrue($1.comments == interactor.entity?.events?[$0].comments)
        })
    }
}

//MARK: - AUX FUNCTIONS -
extension EventsInteractorTests {
    private func setMockInteractor(fileName: String) -> EventsInteractorMock {
        let service = EventsServiceMock(fileName: fileName)
        let interactor = EventsInteractorMock(service: service)
        interactor.getEvents()
        return interactor
    }
}
