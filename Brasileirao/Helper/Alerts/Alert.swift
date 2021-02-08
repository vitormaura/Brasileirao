//
//  Alert.swift
//  Brasileirao
//
//  Created by Vitor Maura on 04/10/20.
//

import UIKit

class Alert {
    //MARK: - VARIABLES -
    public var viewController: UIViewController
    
    //MARK: - INIT -
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    //MARK: - FUNCTIONS -
    public func showAlert(title: String?,
                          message: String?,
                          confirmButtonTitle: String?,
                          confirmAction: (() -> ())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: confirmButtonTitle,
                                          style: .default,
                                          handler: { _ in
                                            DispatchQueue.main.async {
                                                HapticAlert.hapticReturn(style: .medium)
                                                confirmAction?()
                                            }})
        alert.addAction(confirmAction)
        self.viewController.present(alert, animated: true)
    }
}
