//
//  RoundInteractorProtocol.swift
//  Brasileirao
//
//  Created by Vitor Maura on 01/10/20.
//

import Foundation

// MARK: - INTERACTOR INPUT PROTOCOL -
public protocol RoundInteractorInput: class {
    // MARK: - VARIABLES -
    var output: RoundInteractorOutput? { get set }
    var service: RoundServiceInput { get set }
    var dataBase: RoundDatabaseInput { get set }
    
    // MARK: - INPUT FUNCTIONS -
    func getRound()
}

// MARK: - INTERACTOR OUTPUT PROTOCOL -
public protocol RoundInteractorOutput: class {
    
    // MARK: - OUTPUT FUNCTIONS -
    func handleRoundSuccess(response: RoundResponse)
    func handleRoundSuccessFromDB(response: RoundResponse)
    func handleRoundError()
}
