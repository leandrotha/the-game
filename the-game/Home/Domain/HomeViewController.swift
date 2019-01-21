//
//  HomeViewController.swift
//  the-game
//
//  Created by Livetouch on 16/01/19.
//  Copyright © 2019 Leandro B Tha. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }
    
    func setupTabBar() {
        let firstVc = UIViewController()
        firstVc.title = "Meus grupos"
        firstVc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let secondVc = UIViewController()
        secondVc.title = "Second"
        
        let controllers = [firstVc, secondVc]
        
        viewControllers = controllers.map {UINavigationController(rootViewController: $0)}
    }

}
