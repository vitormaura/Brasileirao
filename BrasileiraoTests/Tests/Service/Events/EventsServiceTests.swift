//
//  EventsServiceTests.swift
//  BrasileiraoTests
//
//  Created by Vitor Maura on 06/10/20.
//

import Foundation
import XCTest

class EventsServiceTests: XCTestCase {
    //MARK: - FUNCTIONS -
    func testSuccessEventsService() {
        var isSuccess = false
        let service = EventsServiceMock(fileName: "eventsSuccess")
        service.getEvents { result in
            switch result {
            case .success(_):
                isSuccess = true
            case .failure(_):
                isSuccess = false
            }
        }
        XCTAssertTrue(isSuccess)
    }
    
    func testErrorEventsService() {
        var isSuccess = false
        let service = EventsServiceMock(fileName: "error")
        service.getEvents { result in
            switch result {
            case .success(_):
                isSuccess = true
            case .failure(_):
                isSuccess = false
            }
        }
        XCTAssertFalse(isSuccess)
    }
}
