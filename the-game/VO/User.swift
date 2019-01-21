//
//  User.swift
//  the-game
//
//  Created by Leandro Bartsch Thá on 26/12/18.
//  Copyright © 2018 Leandro B Tha. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    var email :String?
    var senha :String?
    var nome :String?
    var foto :UIImage?
    
    init(email: String? = "", senha: String? = "") {
        self.email = email
        self.senha = senha
    }
    
}
