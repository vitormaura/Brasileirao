//
//  EventEntity.swift
//  Brasileirao
//
//  Created by Vitor Maura on 05/10/20.
//

import Foundation

struct EventEntity: Codable {
    // MARK: - VARIABLES -
    let match_id: String?
    let events: [EventsMatchEntity]?
    
    // MARK: - CODING KEYS -
    enum CodingKeys: String, CodingKey {
        case match_id = "match_id"
        case events = "events"
    }
}

struct EventsMatchEntity: Codable {
    // MARK: - VARIABLES -
    let elapsed: Int?
    let elapsed_plus: Int?
    let teamName: String?
    let logo: String?
    let player: String?
    let assist: String?
    let type: String?
    let detail: String?
    let comments: String?

    // MARK: - CODING KEYS -
    enum CodingKeys: String, CodingKey {
        case elapsed = "elapsed"
        case elapsed_plus = "elapsed_plus"
        case teamName = "teamName"
        case logo = "logo"
        case player = "player"
        case assist = "assist"
        case type = "type"
        case detail = "detail"
        case comments = "comments"
    }
}

