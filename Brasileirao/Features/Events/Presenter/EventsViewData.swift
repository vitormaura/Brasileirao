//
//  EventsViewData.swift
//  Brasileirao
//
//  Created by Vitor Maura on 05/10/20.
//

import Foundation

public struct EventsViewData {
    // MARK: - VARIABLES -
    var refreshDate = ""
    var match = MatchViewData()
    var events = [EventsMatchViewData]()
    
    //MARK: - INIT -
    init() { }
    init(response: EventsResponse) {
        self.refreshDate = response.refreshDate.dateToString
        let events = response.events.map({ EventsMatchViewData(response: $0) })
        self.events = events.sorted(by: { $0.elapsedTime > $1.elapsedTime })
    }
}

public struct EventsMatchViewData {
    // MARK: - VARIABLES -
    var elapsedTime = ""
    var detailImageName = ""
    var teamLogoUrl = ""
    var eventTitle = ""
    var eventDetail = ""
    
    //MARK: - INIT -
    init() { }
    init(response: EventsMatchResponse) {
        self.elapsedTime = "\(response.elapsed + response.elapsedPlus)'"
        self.detailImageName = response.type
        self.teamLogoUrl = response.teamLogo
        self.eventTitle = response.detail.uppercased()
        self.eventDetail = self.getEventDetail(response: response)
    }
    
    private func getEventDetail(response: EventsMatchResponse) -> String {
        switch response.type.lowercased() {
        case "substitution":
            return "Entra: \(response.player)\nSai: \(response.assist)"
        default:
            return "\(response.player)\n\(response.comments)"
        }
    }
}
