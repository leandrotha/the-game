//
//  AppDelegate.swift
//  the-game
//
//  Created by Livetouch on 12/12/18.
//  Copyright © 2018 Leandro B Tha. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    static let shared = {
        return UIApplication.shared.delegate
    }()

    //MARK: Application Delegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        setupNavigationController()
        
        return true
    }
    
    //MARK: Helpers
    
    func setupNavigationController() {
        guard let window = window else {
            fatalError()
        }
        
        window.rootViewController = UINavigationController(rootViewController: LoginViewController(nibName: "LoginViewController", bundle: nil))
        window.makeKeyAndVisible()
    }

}

