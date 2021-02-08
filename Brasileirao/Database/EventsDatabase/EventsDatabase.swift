//
//  EventsDatabase.swift
//  Brasileirao
//
//  Created by Vitor Maura on 05/10/20.
//

import Foundation

class EventsDatabase {
    //MARK: - VARIABLES -
    lazy var dataBase = DatabaseManager()
}

//MARK: - FUNCTIONS -
extension EventsDatabase: EventsDatabaseInput {
    func createOrUpdate(with data: Data, and matchId: String) {
        if let eventsData: EventsData = self.dataBase.getObject() {
            self.dataBase.delete(object: eventsData)
        }
        guard let eventsData: EventsData = self.dataBase.getInstance() else { return }
        eventsData.id = matchId
        eventsData.data = data
        eventsData.refreshDate = Date()
        MainDatabase.shared.saveContext()
    }
    
    func getEventsFromDatabase(matchId: String) -> EventsData? {
        guard let eventsData: EventsData = self.dataBase.getObject(with: matchId)
              else { return nil }
        return eventsData
    }
}
