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
            return firstName() + " " + lastName()
        }
        
        public static func firstName() -> String {
            guard let fnames = sharedName.first_names else { return "" }
            guard let fname = randObj(fnames) as? String else { return "" }
            return fname
        }
        
        public static func lastName() -> String {
            guard let lnames = sharedName.last_names else { return "" }
            guard let lname = randObj(lnames) as? String else { return "" }
            return lname
        }
        
        public static func prefix() -> String {
            guard let prefixes = sharedName.prefixes else { return "" }
            guard let prfx = randObj(prefixes) as? String else { return "" }
            return prfx
        }
        
        public static func suffix() -> String {
            guard let suffixes = sharedName.suffixes else { return "" }
            guard let sffx = randObj(suffixes) as? String else { return "" }
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
            
            guard let descriptor = randObj(descriptors) as? String else { return "" }
            guard let level = randObj(levels) as? String else { return "" }
            guard let job = randObj(jobs) as? String else { return "" }
            
            return descriptor + " " + level + " " + job
        }
    }
}