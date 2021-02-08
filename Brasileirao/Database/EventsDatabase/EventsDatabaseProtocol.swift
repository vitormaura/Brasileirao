//
//  EventsDatabaseProtocol.swift
//  Brasileirao
//
//  Created by Vitor Maura on 05/10/20.
//

import Foundation

public protocol EventsDatabaseInput: class {
    //MARK: - FUNCTIONS -
    func createOrUpdate(with data: Data, and matchId: String)
    func getEventsFromDatabase(matchId: String) -> EventsData?
}
