//
//  BrasileiraoUITests.swift
//  BrasileiraoUITests
//
//  Created by Vitor Maura on 01/10/20.
//

import XCTest

class BaseUITests: XCTestCase {
     // MARK: - CONSTANTS -
    let app = XCUIApplication()
}

// MARK: - SETUP AND TEARDOWN -
extension BaseUITests {
    override func setUp() {
        super.setUp()
        self.continueAfterFailure = false
    }
    
    override func tearDown() {
        self.app.terminate()
        super.tearDown()
    }
}


// MARK: - MANAGER TEST -
extension BaseUITests {
    func afterLaunchingTheApp() {
        XCTContext.runActivity(named: "After starting the app") { _ in
            self.app.launch()
        }
    }
}

// MARK: - VIEW  -
extension BaseUITests {
    func iSeeTheView(identifier: String) {
        XCTContext.runActivity(named: "I see the view \(identifier)") { _ in
            let resultView = self.app.otherElements[identifier]
            XCTAssert(resultView.exists)
        }
    }
    
    func getStaticTexts(title: String) {
        XCTContext.runActivity(named: "I see the text \(title)") { _ in
            XCTAssert(app.staticTexts[title].exists)
        }
    }
}


// MARK: - TABLEVIEW -
extension BaseUITests {
    func iSeeTheCell(identifier: String, tableIdentifier: String) {
        XCTContext.runActivity(named: "I see the cell \(identifier)") { _ in
            let table = self.app.tables[tableIdentifier]
            let resultCell = table.cells[identifier]
            let viewExists = resultCell.waitForExistence(timeout: 10)
            XCTAssert(viewExists)
        }
    }
    
    func iSelectTheCell(identifier: String) {
        XCTContext.runActivity(named: "I Select the cell \(identifier)") { _ in
            self.app.tables.cells[identifier].tap()
        }
    }
}
