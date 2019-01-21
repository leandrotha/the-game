//
//  AppDelegate.swift
//  the-game
//
//  Created by Livetouch on 12/12/18.
//  Copyright © 2018 Leandro B Tha. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    static let shared = {
        return UIApplication.shared.delegate
    }()

    //MARK: Application Delegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        setupNavigationController()
        setupFireBaseProducts()
        
        return true
    }
    
    
    //MARK: Helpers
    
    func setupFireBaseProducts() {
        FirebaseApp.configure()
    }
    
    func setupNavigationController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let navController = UINavigationController(rootViewController: LoginViewController(nibName: "LoginViewController", bundle: nil))
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }

}

