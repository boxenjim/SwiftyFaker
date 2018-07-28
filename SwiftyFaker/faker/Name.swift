//
//  Name.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    open class Name: Faker {
        fileprivate var first_names: [String]?
        fileprivate var last_names: [String]?
        fileprivate var prefixes: [String]?
        fileprivate var suffixes: [String]?
        fileprivate var titles: [String : AnyObject]?
        
        fileprivate var descriptors: [String]? {
            return titles?["descriptor"] as? [String]
        }
        
        fileprivate var levels: [String]? {
            return titles?["level"] as? [String]
        }
        
        fileprivate var jobs: [String]? {
            return titles?["job"] as? [String]
        }
        
        // MARK: NSKeyValueCoding
        open override func setValue(_ value: Any?, forKey key: String) {
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
        
        fileprivate static let _name = Name(dictionary: Faker.JSON("name"))
        
        // MARK: Private Name methods
        fileprivate func names() -> [String] {
            return ["\(Name.prefix()) \(Name.firstName()) \(Name.lastName())",
                "\(Name.firstName()) \(Name.lastName()) \(Name.suffix())",
                "\(Name.firstName()) \(Name.lastName())",
                "\(Name.firstName()) \(Name.lastName())",
                "\(Name.firstName()) \(Name.lastName())",
                "\(Name.firstName()) \(Name.lastName())"]
        }
        
        // MARK: Public Name methods
        open static func name() -> String {
            return _name.names().random()
        }
        
        open static func firstName() -> String {
            guard let fnames = _name.first_names else { return "" }
            let fname = fnames.random()
            return fname
        }
        
        open static func lastName() -> String {
            guard let lnames = _name.last_names else { return "" }
            let lname = lnames.random()
            return lname
        }
        
        open static func prefix() -> String {
            guard let prefixes = _name.prefixes else { return "" }
            let prfx = prefixes.random()
            return prfx
        }
        
        open static func suffix() -> String {
            guard let suffixes = _name.suffixes else { return "" }
            let sffx = suffixes.random()
            return sffx
        }
        
        /** 
            Generate a buzzword-laden job title, 
            Wordlist from http://www.bullshitjob.com/title/
        */
        open static func title() -> String {
            guard let descriptors = _name.descriptors else { return "" }
            guard let levels = _name.levels else { return "" }
            guard let jobs = _name.jobs else { return "" }
            
            return descriptors.random() + " " + levels.random() + " " + jobs.random()
        }
    }
}
