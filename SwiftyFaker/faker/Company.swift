//
//  Company.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    public class Company: Faker {
        private var suffixes: [String]?
        private var buzzwords: [[String]]?
        private var bsWords: [[String]]?
        
        // MARK: NSKeyValueCoding
        public override func setValue(value: AnyObject?, forKey key: String) {
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
        
        private static let company = Company(dictionary: Faker.companyJSON())
        
        // MARK: Private methods
        private func names() -> [String] {
            return ["\(Name.lastName()) \(Company.suffix())",
                "\(Name.lastName())-\(Name.lastName())",
                "\(Name.lastName()), \(Name.lastName()) and \(Name.lastName())"]
        }
        
        // MARK: Methods
        public static func name() -> String {
            let name = company.names().random()
            return name
        }
        
        public static func suffix() -> String {
            guard let suffixes = company.suffixes else { return "" }
            return suffixes.random()
        }
        
        public static func catchPhrase() -> String {
            guard let buzzwords = company.buzzwords else { return "" }
            var phrases = [String]()
            for array in buzzwords {
                phrases.append(array.random())
            }
            return phrases.joinWithSeparator(" ")
        }
        
        public static func buzzword() -> String {
            guard let buzzwords = company.buzzwords else { return "" }
            let words = buzzwords.random()
            let word = words.random()
            return word
        }
        
        public static func bs() -> String {
            guard let bsWords = company.bsWords else { return "" }
            var phrases = [String]()
            for array in bsWords {
                phrases.append(array.random())
            }
            return phrases.joinWithSeparator(" ")
        }
        
        public static func ein() -> String {
            return ""
        }
        
        public static func dunsNumber() -> String {
            return ""
        }
        
        public static func logo() -> String {
            let rand = Int.random(1...13)
            return "http://pigment.github.io/fake-logos/logos/medium/color/\(rand).png"
        }
        
        public static func swedishOrganisationNumber() -> String {
            return ""
        }
    }
}