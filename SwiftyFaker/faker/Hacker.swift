//
//  Hacker.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    public class Hacker: Faker {
        private var abbreviations: [String]?
        private var adjectives: [String]?
        private var nouns: [String]?
        private var verbs: [String]?
        private var ingverbs: [String]?
        
        // MARK: NSKeyValueCoding
        public override func setValue(value: AnyObject?, forKey key: String) {
            if key == "abbreviation" {
                abbreviations = value as? [String]
            } else if key == "adjective" {
                adjectives = value as? [String]
            } else if key == "noun" {
                nouns = value as? [String]
            } else if key == "verb" {
                verbs = value as? [String]
            } else if key == "ingverb" {
                ingverbs = value as? [String]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        private static let _hacker = Hacker(dictionary: Faker.JSON("hacker"))
        
        // MARK: Private methods
        private func phrases() -> [String] {
            return ["If we \(Hacker.verb()) the \(Hacker.noun()), we can get to the \(Hacker.abbreviation()) \(Hacker.noun()) through the \(Hacker.adjective()) \(Hacker.abbreviation()) \(Hacker.noun())!",
                "We need to \(Hacker.verb()) the \(Hacker.adjective()) \(Hacker.abbreviation()) \(Hacker.noun())!",
                "Try to \(Hacker.verb()) the \(Hacker.abbreviation()) \(Hacker.noun()), maybe it will \(Hacker.verb()) the \(Hacker.adjective()) \(Hacker.noun())!",
                "You can't \(Hacker.verb()) the \(Hacker.noun()) without \(Hacker.ingverb()) the \(Hacker.adjective()) \(Hacker.abbreviation()) \(Hacker.noun())!",
                "Use the \(Hacker.adjective()) \(Hacker.abbreviation()) \(Hacker.noun()), then you can \(Hacker.verb()) the \(Hacker.adjective()) \(Hacker.noun())!",
                "The \(Hacker.abbreviation()) \(Hacker.noun()) is down, \(Hacker.verb()) the \(Hacker.adjective()) \(Hacker.noun()) so we can \(Hacker.verb()) the \(Hacker.abbreviation()) \(Hacker.noun())!",
                "\(Hacker.ingverb()) the \(Hacker.noun()) won't do anything, we need to \(Hacker.verb()) the \(Hacker.adjective()) \(Hacker.abbreviation()) \(Hacker.noun())!",
                "I'll \(Hacker.verb()) the \(Hacker.adjective()) \(Hacker.abbreviation()) \(Hacker.noun()), that should \(Hacker.noun()) the \(Hacker.abbreviation()) \(Hacker.noun())!"]
        }
        
        // MARK: Methods
        public static func saySomethingSmart() -> String {
            return _hacker.phrases().random()
        }
        
        public static func abbreviation() -> String {
            guard let abbreviations = _hacker.abbreviations else { return "" }
            return abbreviations.random()
        }
        
        public static func adjective() -> String {
            guard let adjectives = _hacker.adjectives else { return "" }
            return adjectives.random()
        }
        
        public static func noun() -> String {
            guard let nouns = _hacker.nouns else { return "" }
            return nouns.random()
        }
        
        public static func verb() -> String {
            guard let verbs = _hacker.verbs else { return "" }
            return verbs.random()
        }
        
        public static func ingverb() -> String {
            guard let ingverbs = _hacker.ingverbs else { return "" }
            return ingverbs.random()
        }
    }
}