//
//  University.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    open class University: Faker {
        fileprivate var prefixes: [String]?
        fileprivate var suffixes: [String]?
        
        // MARK: NSKeyValueCoding
        open override func setValue(_ value: Any?, forKey key: String) {
            if key == "prefix" {
                prefixes = value as? [String]
            } else if key == "suffix" {
                suffixes = value as? [String]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        fileprivate static let _university = University(dictionary: Faker.JSON("university"))
        
        // MARK: Private Name methods
        fileprivate func names() -> [String] {
            return ["\(Name.lastName()) \(University.suffix())",
                "\(University.prefix()) \(Name.lastName()) \(University.suffix())",
                "\(University.prefix()) \(Name.lastName())",
                "\(University.prefix()) \(Address.state()) \(University.suffix())"]
        }
        
        // MARK: Methods
        open static func name() -> String {
            return _university.names().random()
        }
        
        open static func prefix() -> String {
            guard let prefixes = _university.prefixes else { return "" }
            return prefixes.random()
        }
        
        open static func suffix() -> String {
            guard let suffixes = _university.suffixes else { return "" }
            return suffixes.random()
        }
    }
}
