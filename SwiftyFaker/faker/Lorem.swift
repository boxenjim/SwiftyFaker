//
//  Lorem.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    open class Lorem: Faker {
        fileprivate var wrds: [String]?
        fileprivate var supplementals: [String]?
        
        // MARK: NSKeyValueCoding
        open override func setValue(_ value: Any?, forKey key: String) {
            if key == "word" {
                wrds = value as? [String]
            } else if key == "supplemental" {
                supplementals = value as? [String]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        fileprivate static let _lorem = Lorem(dictionary: Faker.JSON("lorem"))
        
        // MARK: Public Lorem methods
        open static func character() -> String {
            return characters(1)
        }
        
        open static func characters(_ charCount: Int = 255) -> String {
            return ""
        }
        
        open static func word() -> String {
            let wrds = words(1) as [String]
            let word = wrds.last!
            return word
        }
        
        open static func words(_ count: Int = 3, supplemental: Bool = false) -> [String] {
            guard let wordsArray = _lorem.wrds else { return [String]() }
            guard let supplementals = _lorem.supplementals else { return [String]() }
            
            var array = [String]()
            
            for _ in 0..<count {
                let randWord = supplemental ? supplementals.random() : wordsArray.random()
                array.append(randWord)
            }
            
            return array
        }
        
        open static func sentence(_ wordCount: Int = 4, supplimental: Bool = false, randomWordsToAdd: Int = 6) -> String {
            let array = words(wordCount, supplemental: supplimental)
            let sentence = array.joined(separator: " ")
            return sentence + "."
        }
        
        open static func sentences(_ sentenceCount: Int = 3, supplemental: Bool = false) -> String  {
            return ""
        }
        
        open static func paragraph(_ sentenceCount: Int = 3, supplemental: Bool = false, randomSentencesToAdd: Int = 3) -> String  {
            return ""
        }
        
        open static func paragraphs(_ paragraphCount: Int = 3, supplemental: Bool = false) -> String {
            return ""
        }
    }
}
