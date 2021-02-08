//
//  ExtensionString.swift
//  Brasileirao
//
//  Created by Vitor Maura on 01/10/20.
//

import Foundation

extension String {
    // MARK: - VARIABLES -
    public var removeAccents: String {
        self.folding(options: .diacriticInsensitive, locale: Locale.current)
    }
    
    public var teamName: String {
        guard self.count >= 3 else { return self }
        return String(self.uppercased().prefix(3))
    }
}
