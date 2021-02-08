//
//  RoundUITests.swift
//  BrasileiraoUITests
//
//  Created by Vitor Maura on 06/10/20.
//

import Foundation
import XCTest

class RoundUITests: BaseUITests {
    //MARK: - FUNCTIONS -
    func testRoundViewControlller() {
        self.afterLaunchingTheApp()
        self.iSeeTheView(identifier: Identifiers.roundView)
    }
    
    func testeNavigationTitle() {
        self.afterLaunchingTheApp()
        self.getStaticTexts(title: Identifiers.roundNavigationTitle)
    }
        
    func testGoToEventsViewController() {
        self.afterLaunchingTheApp()
        self.iSeeTheCell(identifier: Identifiers.matchCell, tableIdentifier: Identifiers.roundTableView)
        self.iSelectTheCell(identifier: Identifiers.matchCell)
        self.iSeeTheView(identifier: Identifiers.eventsView)
    }
}
