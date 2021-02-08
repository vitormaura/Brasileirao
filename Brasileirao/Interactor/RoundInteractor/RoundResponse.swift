//
//  RoundResponse.swift
//  Brasileirao
//
//  Created by Vitor Maura on 01/10/20.
//

import Foundation

// MARK: - INTERACTOR RESPONSE -
public struct RoundResponse {
    // MARK: - VARIABLES -
    let refreshDate: Date
    let matches: [MatchResponse]
    
    //MARK: - INIT -
    init? (entity: RoundEntity, refreshDate: Date) {
        guard let matches = entity.matches, !matches.isEmpty else { return nil }
        let matchesResponse = matches.compactMap({ MatchResponse(entity: $0) })
        self.matches = matchesResponse
        self.refreshDate = refreshDate
    }
}

public struct MatchResponse {
    // MARK: - VARIABLES -
    let matchId: String
    let homeTeamName: String
    let homeTeamLogoUrl: String
    let goalsHomeTeam: Int
    let awayTeamName: String
    let awayTeamLogoUrl: String
    let goalsAwayTeam: Int
    let eventDate: Double
    let venue: String
    
    //MARK: - INIT -
    init? (entity: MatchesEntity) {
        guard let matchId = entity.match_id,
              let homeTeamName = entity.homeTeam?.team_name, !homeTeamName.isEmpty,
              let homeTeamLogoUrl = entity.homeTeam?.logo, !homeTeamLogoUrl.isEmpty,
              let goalsHomeTeam = entity.goalsHomeTeam,
              let awayTeamName = entity.awayTeam?.team_name, !awayTeamName.isEmpty,
              let awayTeamLogoUrl = entity.awayTeam?.logo, !awayTeamLogoUrl.isEmpty,
              let goalsAwayTeam = entity.goalsAwayTeam,
              let eventDate = entity.event_timestamp, eventDate != 0,
              let venue = entity.venue
              else { return nil }
        self.matchId = matchId
        self.homeTeamName = homeTeamName
        self.homeTeamLogoUrl = homeTeamLogoUrl
        self.goalsHomeTeam = goalsHomeTeam
        self.awayTeamName = awayTeamName
        self.awayTeamLogoUrl = awayTeamLogoUrl
        self.goalsAwayTeam = goalsAwayTeam
        self.eventDate = Double(eventDate)
        self.venue = venue
    }
}
