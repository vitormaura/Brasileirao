//
//  RoundDatabase.swift
//  Brasileirao
//
//  Created by Vitor Maura on 03/10/20.
//

import Foundation

class RoundDatabase {
    //MARK: - VARIABLES -
    lazy var dataBase = DatabaseManager()
}

//MARK: - FUNCTIONS -
extension RoundDatabase: RoundDatabaseInput {
    func createOrUpdate(with data: Data) {
        if let roundData: RoundData = self.dataBase.getObject() {
            self.dataBase.delete(object: roundData)
        }
        guard let roundData: RoundData = self.dataBase.getInstance() else { return }
        roundData.data = data
        roundData.refreshDate = Date()
        MainDatabase.shared.saveContext()
    }
    
    func getRoundFromDatabase() -> RoundData? {
        guard let roundData: RoundData = self.dataBase.getObject()
              else { return nil }
        return roundData
    }
}
