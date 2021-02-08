//
//  EventsResponse.swift
//  Brasileirao
//
//  Created by Vitor Maura on 05/10/20.
//

import Foundation

// MARK: - INTERACTOR RESPONSE -
public struct EventsResponse {
    // MARK: - VARIABLES -
    let matchId: String
    let refreshDate: Date
    let events: [EventsMatchResponse]
    
    //MARK: - INIT -
    init? (entity: EventEntity, refreshDate: Date) {
        guard let events = entity.events, !events.isEmpty,
              let matchId = entity.match_id
              else { return nil }
        let eventsResponse = events.compactMap({ EventsMatchResponse(entity: $0) })
        self.matchId = matchId
        self.refreshDate = refreshDate
        self.events = eventsResponse
    }
}

public struct EventsMatchResponse {
    // MARK: - VARIABLES -
    let elapsed: Int
    let elapsedPlus: Int
    let teamName: String
    let teamLogo: String
    let player: String
    let assist: String
    let type: String
    let detail: String
    let comments: String
    
    //MARK: - INIT -
    init? (entity: EventsMatchEntity) {
        guard let elapsed = entity.elapsed,
              let elapsedPlus = entity.elapsed_plus,
              let teamName = entity.teamName, !teamName.isEmpty,
              let teamLogo = entity.logo, !teamLogo.isEmpty,
              let player = entity.player, !player.isEmpty,
              let assist = entity.assist,
              let type = entity.type, !type.isEmpty,
              let detail = entity.detail, !detail.isEmpty,
              let comments = entity.comments
              else { return nil }
        self.elapsed = elapsed
        self.elapsedPlus = elapsedPlus
        self.teamName = teamName
        self.teamLogo = teamLogo
        self.player = player
        self.assist = assist
        self.type = type
        self.detail = detail
        self.comments = comments
    }
}
