//
//  RoundPresenterProtocol.swift
//  Brasileirao
//
//  Created by Vitor Maura on 01/10/20.
//

import Foundation

// MARK: - PRESENTER INPUT PROTOCOL -
public protocol RoundPresenterInput: class {
    // MARK: - VARIABLES -
    var output: RoundPresenterOutput? { get }
    var roundInteractor: RoundInteractorInput { get }
    
    // MARK: - INPUT FUNCTIONS -
    func getRound()
}

// MARK: - PRESENTER OUTPUT PROTOCOL -
public protocol RoundPresenterOutput: class {
    
    // MARK: - OUTPUT FUNCTIONS -
    func startLoading()
    func stopLoading()
    func setViewData(viewData: RoundViewData)
    func setViewDataFromDB(viewData: RoundViewData)
    func setError()
}
