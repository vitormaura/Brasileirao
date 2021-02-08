//
//  RoundDatabaseProtocol.swift
//  Brasileirao
//
//  Created by Vitor Maura on 03/10/20.
//

import Foundation

public protocol RoundDatabaseInput: class {
    //MARK: - FUNCTIONS -
    func createOrUpdate(with data: Data)
    func getRoundFromDatabase() -> RoundData?
}
