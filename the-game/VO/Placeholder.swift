//
//  Placeholder.swift
//  the-game
//
//  Created by Leandro Bartsch Tha on 06/02/19.
//  Copyright © 2019 Leandro B Tha. All rights reserved.
//

import Foundation

class Placeholder {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?

    init(userId: Int = nil, id: Int = nil, title: String = nil, body: String = nil) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}
