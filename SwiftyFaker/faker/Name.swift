//
//  Name.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    public class Name: Faker {
        private var first_names: [String]?
        private var last_names: [String]?
        private var prefixes: [String]?
        private var suffixes: [String]?
        private var titles: [String : AnyObject]?
        
        private var descriptors: [String]? {
            return titles?["descriptor"] as? [String]
        }
        
        private var levels: [String]? {
            return titles?["level"] as? [String]
        }
        
        private var jobs: [String]? {
            return titles?["job"] as? [String]
        }
        
        // MARK: NSKeyValueCoding
        public override func setValue(value: AnyObject?, forKey key: String) {
            if key == "first_name" {
                first_names = value as? [String]
            } else if key == "last_name" {
                last_names = value as? [String]
            } else if key == "prefix" {
                prefixes = value as? [String]
            } else if key == "suffix" {
                suffixes = value as? [String]
            } else if key == "title" {
                titles = value as? [String : AnyObject]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        private static let _name = Name(dictionary: Faker.JSON("name"))
        
        // MARK: Private Name methods
        private func names() -> [String] {
            return ["\(Name.prefix()) \(Name.firstName()) \(Name.lastName())",
                "\(Name.firstName()) \(Name.lastName()) \(Name.suffix())",
                "\(Name.firstName()) \(Name.lastName())",
                "\(Name.firstName()) \(Name.lastName())",
                "\(Name.firstName()) \(Name.lastName())",
                "\(Name.firstName()) \(Name.lastName())"]
        }
        
        // MARK: Public Name methods
        public static func name() -> String {
            return _name.names().random()
        }
        
        public static func firstName() -> String {
            guard let fnames = _name.first_names else { return "" }
            let fname = fnames.random()
            return fname
        }
        
        public static func lastName() -> String {
            guard let lnames = _name.last_names else { return "" }
            let lname = lnames.random()
            return lname
        }
        
        public static func prefix() -> String {
            guard let prefixes = _name.prefixes else { return "" }
            let prfx = prefixes.random()
            return prfx
        }
        
        public static func suffix() -> String {
            guard let suffixes = _name.suffixes else { return "" }
            let sffx = suffixes.random()
            return sffx
        }
        
        /** 
            Generate a buzzword-laden job title, 
            Wordlist from http://www.bullshitjob.com/title/
        */
        public static func title() -> String {
            guard let descriptors = _name.descriptors else { return "" }
            guard let levels = _name.levels else { return "" }
            guard let jobs = _name.jobs else { return "" }
            
            return descriptors.random() + " " + levels.random() + " " + jobs.random()
        }
    }
}