//
//  HomeViewController.swift
//  the-game
//
//  Created by Livetouch on 16/01/19.
//  Copyright © 2019 Leandro B Tha. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let padding: CGFloat = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView() {
        let label = UILabel(frame: CGRect(x: (UIScreen.main.bounds.width / 2) - padding, y: (UIScreen.main.bounds.height / 2) - padding, width: UIScreen.main.bounds.width - (padding * 2), height: 50.0))
        label.text = "Hello!"
        
        view.addSubview(label)
        view.layoutIfNeeded()
    }
    
}
