//
//  BaseService.swift
//  Brasileirao
//
//  Created by Vitor Maura on 01/10/20.
//

import Foundation

class BaseService {
    //MARK: - VARIABLES -
    lazy var serviceUrl = ""
    lazy var session = URLSession(configuration: .default)
    
    //MARK: - HOST -
    lazy var host: String = {
        "https://5f754dda1cf3c900161cdee5.mockapi.io/seriea"
    }()
    
    //MARK: - VERSION -
    lazy var version: String = {
        "/v1"
    }()
    
}
