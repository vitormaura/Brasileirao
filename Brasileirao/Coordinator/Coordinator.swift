//
//  Coordinator.swift
//  Brasileirao
//
//  Created by Vitor Maura on 01/10/20.
//

import UIKit

protocol Coordinator: AnyObject {
    //MARK: - VARIABLES -
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    //MARK: - FUNCTIONS -
    func start()
}
