//
//  ExtensionDouble.swift
//  Brasileirao
//
//  Created by Vitor Maura on 01/10/20.
//

import Foundation

extension Double {
    // MARK: - VARIABLES -
    public var timestampToString: String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy - HH:mm"
        dateFormatter.timeZone = TimeZone(abbreviation: "pt-BR")
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
}
