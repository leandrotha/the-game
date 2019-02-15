//
//  MeusAmigosViewController.swift
//  the-game
//
//  Created by Livetouch on 18/01/19.
//  Copyright © 2019 Leandro B Tha. All rights reserved.
//

import UIKit
import Firebase
import AlamofireImage

class MeusAmigosViewController: UITableViewController {
    
    //MARK: - Properties
    
    var amigos = [User]()
    var database: Database?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    //MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
   
}
