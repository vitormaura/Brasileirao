//
//  RoundServiceProtocol.swift
//  Brasileirao
//
//  Created by Vitor Maura on 01/10/20.
//

import Foundation

public protocol RoundServiceInput: class {
    //MARK: - FUNCTIONS -
    func getRound(completion: @escaping (Result<Data, ServiceError>) -> ())
}
