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
        private var names = ["\(Name.prefix()) \(Name.firstName()) \(Name.lastName())", "\(Name.firstName()) \(Name.lastName()) \(Name.suffix())", "\(Name.firstName()) \(Name.lastName())", "\(Name.firstName()) \(Name.lastName())", "\(Name.firstName()) \(Name.lastName())", "\(Name.firstName()) \(Name.lastName())"]
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
        
        private static let sharedName = Name(dictionary: Faker.nameJSON())
        
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
        
        // MARK: Name methods
        public static func name() -> String {
            return sharedName.names.random()
        }
        
        public static func firstName() -> String {
            guard let fnames = sharedName.first_names else { return "" }
            let fname = fnames.random()
            return fname
        }
        
        public static func lastName() -> String {
            guard let lnames = sharedName.last_names else { return "" }
            let lname = lnames.random()
            return lname
        }
        
        public static func prefix() -> String {
            guard let prefixes = sharedName.prefixes else { return "" }
            let prfx = prefixes.random()
            return prfx
        }
        
        public static func suffix() -> String {
            guard let suffixes = sharedName.suffixes else { return "" }
            let sffx = suffixes.random()
            return sffx
        }
        
        /** 
            Generate a buzzword-laden job title, 
            Wordlist from http://www.bullshitjob.com/title/
        */
        public static func title() -> String {
            guard let descriptors = sharedName.descriptors else { return "" }
            guard let levels = sharedName.levels else { return "" }
            guard let jobs = sharedName.jobs else { return "" }
            
            return descriptors.random() + " " + levels.random() + " " + jobs.random()
        }
    }
}