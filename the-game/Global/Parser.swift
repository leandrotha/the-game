//
//  Parser.swift
//  the-game
//
//  Created by Leandro Bartsch Tha on 06/02/19.
//  Copyright © 2019 Leandro B Tha. All rights reserved.
//

import Foundation

enum Exception: Error {
    case ParserError
    case ResponseError
}

class Parser {
    static func parserPlaceholder(data: Data?) throws -> [Placeholder] {
        guard let jsonData = data else {throw Exception.ResponseError}
        
        var json: AnyObject?
        
        do {
            json = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as AnyObject
        } catch let error {
            print(error.localizedDescription)
            throw Exception.ParserError
        }
        
        guard let list = json as? [NSDictionary] else {throw Exception.ParserError}
        
        var placeholder = [Placeholder]()
        
        for element in list {
            let tmp = Placeholder()
            
            tmp.userId = element["userId"] as? Int
            tmp.id = element["id"] as? Int
            tmp.title = element["title"] as? String
            tmp.body = element["body"] as? String
            
            placeholder.append(tmp)
        }
        
        return placeholder
    }
}
