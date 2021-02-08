//
//  RoundEntity.swift
//  Brasileirao
//
//  Created by Vitor Maura on 01/10/20.
//

import Foundation

struct RoundEntity: Codable {
    // MARK: - VARIABLES -
    let round_id: String?
    let matches: [MatchesEntity]?
    
    // MARK: - CODING KEYS -
    enum CodingKeys: String, CodingKey {
        case round_id = "round_id"
        case matches = "matches"
    }
}

struct MatchesEntity: Codable {
    // MARK: - VARIABLES -
    let match_id: String?
    let event_timestamp: Int?
    let homeTeam: HomeTeamEntity?
    let awayTeam: AwayTeamEntity?
    let goalsHomeTeam: Int?
    let goalsAwayTeam: Int?
    let venue: String?
    
    // MARK: - CODING KEYS -
    enum CodingKeys: String, CodingKey {
        case match_id = "match_id"
        case event_timestamp = "event_timestamp"
        case homeTeam = "homeTeam"
        case awayTeam = "awayTeam"
        case goalsHomeTeam = "goalsHomeTeam"
        case goalsAwayTeam = "goalsAwayTeam"
        case venue = "venue"
    }
}

struct HomeTeamEntity: Codable {
    // MARK: - VARIABLES -
    let team_name: String?
    let logo: String?
    
    // MARK: - CODING KEYS -
    enum CodingKeys: String, CodingKey {
        case team_name = "team_name"
        case logo = "logo"
    }
}

struct AwayTeamEntity: Codable {
    // MARK: - VARIABLES -
    let team_name: String?
    let logo: String?
    
    // MARK: - CODING KEYS -
    enum CodingKeys: String, CodingKey {
        case team_name = "team_name"
        case logo = "logo"
    }
}
