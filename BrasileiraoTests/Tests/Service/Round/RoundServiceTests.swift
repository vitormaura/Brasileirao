//
//  RoundServiceTests.swift
//  BrasileiraoTests
//
//  Created by Vitor Maura on 06/10/20.
//

import Foundation
import XCTest

class RoundServiceTests: XCTestCase {
    //MARK: - FUNCTIONS -
    func testSuccessRoundService() {
        var isSuccess = false
        let service = RoundServiceMock(fileName: "roundSuccess")
        service.getRound { result in
            switch result {
            case .success(_):
                isSuccess = true
            case .failure(_):
                isSuccess = false
            }
        }
        XCTAssertTrue(isSuccess)
    }
    
    func testErrorRoundService() {
        var isSuccess = false
        let service = RoundServiceMock(fileName: "error")
        service.getRound { result in
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
