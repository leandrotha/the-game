//
//  Constants.swift
//  the-game
//
//  Created by Leandro Bartsch Thá on 26/12/18.
//  Copyright © 2018 Leandro B Tha. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    
    static let backgroundGray = {
        return UIColor.lightGray.withAlphaComponent(0.5)
    }()
    
    static let splashBackgroundBlack = {
        return "#212121".hexToColor()
    }
    
    static let backgroundWhite = {
        return "#FAFAFA".hexToColor()
    }
}
