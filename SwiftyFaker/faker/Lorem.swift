//
//  Lorem.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    class Lorem: Faker {
        private var wrds: [String]?
        private var supplementals: [String]?
        
        private static let sharedLorem = Lorem(dictionary: Faker.loremJSON())
        
        // MARK: NSKeyValueCoding
        override func setValue(value: AnyObject?, forKey key: String) {
            if key == "word" {
                wrds = value as? [String]
            } else if key == "supplemental" {
                supplementals = value as? [String]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        
        static func word() -> String {
            let wrds = words(1) as [String]
            let word = wrds.last!
            return word
        }
        
        static func words(count: Int = 3, supplemental: Bool = false) -> [String] {
            guard let wordsArray = sharedLorem.wrds else { return [String]() }
            guard let supplementals = sharedLorem.supplementals else { return [String]() }
            
            var array = [String]()
            
            for _ in 0..<count {
                let randWord = supplemental ? randObj(supplementals) : randObj(wordsArray)
                array.append(randWord as! String)
            }
            
            return array
        }
        
        static func sentence(wordCount: Int = 4, supplimental: Bool = false/*, randomWordsToAdd: Int = 6*/) -> String {
            let array = words(wordCount, supplemental: supplimental)
            let sentence = array.joinWithSeparator(" ")
            return sentence + "."
        }
    }
}