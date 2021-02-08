//
//  RoundCoordinator.swift
//  Brasileirao
//
//  Created by Vitor Maura on 01/10/20.
//

import UIKit

class RoundCoordinator: Coordinator {
    //MARK: - VARIABLES -
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    //MARK: - INIT -
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK: - FUNCTIONS -
    func start() {
        let viewController = RoundViewController()
        viewController.coordinator = self
        viewController.title = "Brasileirão"
        viewController.navigationItem.backButtonTitle = "Voltar"
        self.navigationController.navigationBar.prefersLargeTitles = true
        self.navigationController.navigationBar.tintColor = .systemGreen
        self.navigationController.pushViewController(viewController, animated: false)
    }
    
    func showEventsMatch(matchViewData: MatchViewData) {
        let child = EventsCoordinator(matchViewData: matchViewData, navigationController: self.navigationController)
        child.parentCoordinator = self
        self.childCoordinators.append(child)
        child.start()
    }
    
    func showAlert(viewController: RoundViewController, refreshDate: String) {
        HapticAlert.hapticReturnStatus(type: .error)
        Alert(viewController: viewController).showAlert(title: "ERRO",
        message: "Ocorreu um erro ao atualizar.\n Estamos apresentando dados da última atualização \(refreshDate)", confirmButtonTitle: "OK")
    }
    
    func childDidFinish(child: Coordinator?) {
        self.childCoordinators.removeAll(where: { $0 === child })
    }
}
