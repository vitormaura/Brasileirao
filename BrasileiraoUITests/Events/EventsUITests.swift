//
//  EventsUITests.swift
//  BrasileiraoUITests
//
//  Created by Vitor Maura on 07/10/20.
//

import Foundation
import XCTest

class EventsUITests: BaseUITests {
    //MARK: - FUNCTIONS -
    func testEventsCell() {
        self.afterLaunchingTheApp()
        self.iSeeTheCell(identifier: Identifiers.matchCell, tableIdentifier: Identifiers.roundTableView)
        self.iSelectTheCell(identifier: Identifiers.matchCell)
        self.iSeeTheView(identifier: Identifiers.eventsView)
        self.iSeeTheCell(identifier: Identifiers.eventCell, tableIdentifier: Identifiers.eventsTable)
    }
    
    func testCardView() {
        self.afterLaunchingTheApp()
        self.iSeeTheCell(identifier: Identifiers.matchCell, tableIdentifier: Identifiers.roundTableView)
        self.iSelectTheCell(identifier: Identifiers.matchCell)
        self.iSeeTheView(identifier: Identifiers.eventsView)
        self.iSeeTheView(identifier: Identifiers.cardViewEvents)
    }
}
