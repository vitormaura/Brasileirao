//
//  RoundViewData.swift
//  Brasileirao
//
//  Created by Vitor Maura on 01/10/20.
//

import Foundation

public struct RoundViewData {
    // MARK: - VARIABLES -
    var refreshDate = ""
    var matches = [MatchViewData]()
    
    //MARK: - INIT -
    init() { }
    init(response: RoundResponse) {
        self.refreshDate = response.refreshDate.dateToString
        self.matches = response.matches.map({ MatchViewData(response: $0) })
    }
}

public struct MatchViewData {
    // MARK: - VARIABLES -
    var matchId = ""
    var eventDate = ""
    var homeTeamName = ""
    var homeTeamScore = ""
    var homeTeamLogoUrl = ""
    var awayTeamName = ""
    var awayTeamScore = ""
    var awayTeamLogoUrl = ""
    var venue = ""
    
    //MARK: - INIT -
    init() { }
    init(response: MatchResponse) {
        self.matchId = response.matchId
        self.eventDate = response.eventDate.timestampToString
        self.homeTeamName = String(response.homeTeamName.teamName.removeAccents)
        self.homeTeamScore = String(response.goalsHomeTeam)
        self.homeTeamLogoUrl = response.homeTeamLogoUrl
        self.awayTeamName = String(response.awayTeamName.teamName.removeAccents)
        self.awayTeamScore = String(response.goalsAwayTeam)
        self.awayTeamLogoUrl = response.awayTeamLogoUrl
        self.venue = response.venue
    }
}
