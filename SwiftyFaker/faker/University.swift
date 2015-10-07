//
//  University.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    public class University: Faker {
        private var prefixes: [String]?
        private var suffixes: [String]?
        
        // MARK: NSKeyValueCoding
        public override func setValue(value: AnyObject?, forKey key: String) {
            if key == "prefix" {
                prefixes = value as? [String]
            } else if key == "suffix" {
                suffixes = value as? [String]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        private static let _university = University(dictionary: Faker.JSON("university"))
        
        // MARK: Private Name methods
        private func names() -> [String] {
            return ["\(Name.lastName()) \(University.suffix())",
                "\(University.prefix()) \(Name.lastName()) \(University.suffix())",
                "\(University.prefix()) \(Name.lastName())",
                "\(University.prefix()) \(Address.state()) \(University.suffix())"]
        }
        
        // MARK: Methods
        public static func name() -> String {
            return _university.names().random()
        }
        
        public static func prefix() -> String {
            guard let prefixes = _university.prefixes else { return "" }
            return prefixes.random()
        }
        
        public static func suffix() -> String {
            guard let suffixes = _university.suffixes else { return "" }
            return suffixes.random()
        }
    }
}