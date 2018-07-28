//
//  Company.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    open class Company: Faker {
        fileprivate var suffixes: [String]?
        fileprivate var buzzwords: [[String]]?
        fileprivate var bsWords: [[String]]?
        
        // MARK: NSKeyValueCoding
        open override func setValue(_ value: Any?, forKey key: String) {
            if key == "suffix" {
                suffixes = value as? [String]
            } else if key == "buzzwords" {
                buzzwords = value as? [[String]]
            } else if key == "bs" {
                bsWords = value as? [[String]]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        fileprivate static let company = Company(dictionary: Faker.JSON("company"))
        
        // MARK: Private methods
        fileprivate func names() -> [String] {
            return ["\(Name.lastName()) \(Company.suffix())",
                "\(Name.lastName())-\(Name.lastName())",
                "\(Name.lastName()), \(Name.lastName()) and \(Name.lastName())"]
        }
        
        // MARK: Methods
        open static func name() -> String {
            let name = company.names().random()
            return name
        }
        
        open static func suffix() -> String {
            guard let suffixes = company.suffixes else { return "" }
            return suffixes.random()
        }
        
        open static func catchPhrase() -> String {
            guard let buzzwords = company.buzzwords else { return "" }
            var phrases = [String]()
            for array in buzzwords {
                phrases.append(array.random())
            }
            return phrases.joined(separator: " ")
        }
        
        open static func buzzword() -> String {
            guard let buzzwords = company.buzzwords else { return "" }
            let words = buzzwords.random()
            let word = words.random()
            return word
        }
        
        open static func bs() -> String {
            guard let bsWords = company.bsWords else { return "" }
            var phrases = [String]()
            for array in bsWords {
                phrases.append(array.random())
            }
            return phrases.joined(separator: " ")
        }
        
        open static func ein() -> String {
            return numerify("##-#######", intConvertable: false)
        }
        
        open static func dunsNumber() -> String {
            return numerify("##-###-####", intConvertable: false)
        }
        
        open static func logo() -> String {
            let rand = Int.random(1...13)
            return "http://pigment.github.io/fake-logos/logos/medium/color/\(rand).png"
        }
        
        open static func swedishOrganisationNumber() -> String {
            return numerify("###########")
        }
    }
}
