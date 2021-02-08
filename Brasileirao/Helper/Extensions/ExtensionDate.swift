//
//  ExtensionDate.swift
//  Brasileirao
//
//  Created by Vitor Maura on 04/10/20.
//

import Foundation

extension Date {
    // MARK: - VARIABLES -
    public var dateToString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy - HH:mm"
        dateFormatter.timeZone = TimeZone(abbreviation: "pt-BR")
        let localDate = dateFormatter.string(from: self)
        return localDate
    }
}
