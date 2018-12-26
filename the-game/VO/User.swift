//
//  User.swift
//  the-game
//
//  Created by Leandro Bartsch Thá on 26/12/18.
//  Copyright © 2018 Leandro B Tha. All rights reserved.
//

import Foundation

class User {
    
    var email :String?
    var senha :String?
    
    init(email: String? = nil, senha: String? = nil) {
        self.email = email
        self.senha = senha
    }
    
}
