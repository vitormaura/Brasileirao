//
//  AppDelegate.swift
//  Brasileirao
//
//  Created by Vitor Maura on 01/10/20.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    //MARK: - VARIABLES -
    var window: UIWindow?
    var coordinator: RoundCoordinator?
    
    //MARK: - FUNCTIONS -
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController()
        coordinator = RoundCoordinator(navigationController: navigationController)
        coordinator?.start()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        MainDatabase.shared.saveContext()
    }
}

