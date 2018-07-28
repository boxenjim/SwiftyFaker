//
//  Book.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    open class Book: Faker {
        fileprivate var titles: [String]?
        fileprivate var publishers: [String]?
        
        // MARK: NSKeyValueCoding
        open override func setValue(_ value: Any?, forKey key: String) {
            if key == "title" {
                titles = value as? [String]
            } else if key == "publisher" {
                publishers = value as? [String]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        fileprivate static let _book = Book(dictionary: Faker.JSON("book"))
        
        
        // MARK: Methods
        open static func title() -> String {
            guard let titles = _book.titles else { return "" }
            return titles.random()
        }
        
        open static func author() -> String {
            return Name.name()
        }
        
        open static func publisher() -> String {
            guard let publishers = _book.publishers else { return "" }
            return publishers.random()
        }
    }
}
