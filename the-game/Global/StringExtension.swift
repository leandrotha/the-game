//
//  StringExtension.swift
//  the-game
//
//  Created by Livetouch on 18/01/19.
//  Copyright © 2019 Leandro B Tha. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func hexToColor(withAlpha: CGFloat = 1.0) -> UIColor {
        let range = NSRange(0..<6)
        let cString = self.trim().replacingOccurrences(of: "#", with: "").uppercased()[range]
        var rgbValue :UInt32 = 0
        
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: withAlpha
        )
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    subscript (r: NSRange) -> String {
        get {
            if let range = Range(r, in: self) {
                return String(self[range])
            }
            return ""
        }
    }
    
}
