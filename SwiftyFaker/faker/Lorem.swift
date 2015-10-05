//
//  Lorem.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    public class Lorem: Faker {
        private var wrds: [String]?
        private var supplementals: [String]?
        
        // MARK: NSKeyValueCoding
        public override func setValue(value: AnyObject?, forKey key: String) {
            if key == "word" {
                wrds = value as? [String]
            } else if key == "supplemental" {
                supplementals = value as? [String]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        private static let _lorem = Lorem(dictionary: Faker.JSON("lorem"))
        
        // MARK: Public Lorem methods
        public static func character() -> String {
            return characters(1)
        }
        
        public static func characters(charCount: Int = 255) -> String {
            return ""
        }
        
        public static func word() -> String {
            let wrds = words(1) as [String]
            let word = wrds.last!
            return word
        }
        
        public static func words(count: Int = 3, supplemental: Bool = false) -> [String] {
            guard let wordsArray = _lorem.wrds else { return [String]() }
            guard let supplementals = _lorem.supplementals else { return [String]() }
            
            var array = [String]()
            
            for _ in 0..<count {
                let randWord = supplemental ? supplementals.random() : wordsArray.random()
                array.append(randWord)
            }
            
            return array
        }
        
        public static func sentence(wordCount: Int = 4, supplimental: Bool = false, randomWordsToAdd: Int = 6) -> String {
            let array = words(wordCount, supplemental: supplimental)
            let sentence = array.joinWithSeparator(" ")
            return sentence + "."
        }
        
        public static func sentences(sentenceCount: Int = 3, supplemental: Bool = false) -> String  {
            return ""
        }
        
        public static func paragraph(sentenceCount: Int = 3, supplemental: Bool = false, randomSentencesToAdd: Int = 3) -> String  {
            return ""
        }
        
        public static func paragraphs(paragraphCount: Int = 3, supplemental: Bool = false) -> String {
            return ""
        }
    }
}