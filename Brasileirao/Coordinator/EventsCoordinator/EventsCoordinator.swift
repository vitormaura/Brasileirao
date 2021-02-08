//
//  EventsCoordinator.swift
//  Brasileirao
//
//  Created by Vitor Maura on 02/10/20.
//

import UIKit

class EventsCoordinator: Coordinator {
    //MARK: - VARIABLES -
    weak var parentCoordinator: RoundCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var matchViewData: MatchViewData
    
    //MARK: - INIT -
    init(matchViewData: MatchViewData, navigationController: UINavigationController) {
        self.matchViewData = matchViewData
        self.navigationController = navigationController
    }
    
    //MARK: - FUNCTIONS -
    func start() {
        let viewController = EventsViewController()
        viewController.viewData.match = self.matchViewData
        viewController.coordinator = self
        viewController.title = "Minuto a minuto"
        self.navigationController.navigationBar.prefersLargeTitles = true
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func showAlert(viewController: EventsViewController, refreshDate: String) {
        HapticAlert.hapticReturnStatus(type: .error)
        Alert(viewController: viewController).showAlert(title: "ERRO",
        message: "Ocorreu um erro ao atualizar.\n Estamos apresentando dados da última atualização \(refreshDate)", confirmButtonTitle: "OK")
    }
    
    func didFinishEvents() {
        self.parentCoordinator?.childDidFinish(child: self)
    }
}
