//
//  Book.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    public class Book: Faker {
        private var titles: [String]?
        private var publishers: [String]?
        
        // MARK: NSKeyValueCoding
        public override func setValue(value: AnyObject?, forKey key: String) {
            if key == "title" {
                titles = value as? [String]
            } else if key == "publisher" {
                publishers = value as? [String]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        private static let _book = Book(dictionary: Faker.JSON("book"))
        
        
        // MARK: Methods
        public static func title() -> String {
            guard let titles = _book.titles else { return "" }
            return titles.random()
        }
        
        public static func author() -> String {
            return Name.name()
        }
        
        public static func publisher() -> String {
            guard let publishers = _book.publishers else { return "" }
            return publishers.random()
        }
    }
}