//
//  App.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    public class App: Faker {
        private var names: [String]?
        private var versions: [String]?
        
        // MARK: NSKeyValueCoding
        public override func setValue(value: AnyObject?, forKey key: String) {
            if key == "name" {
                names = value as? [String]
            } else if key == "version" {
                versions = value as? [String]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        private static let _app = App(dictionary: Faker.appJSON())
        
        // MARK: Private Address methods
        private func authors() -> [String] {
            return ["\(Name.name())", "\(Company.name())"]
        }
        
        // MARK: Methods
        public static func name() -> String {
            guard let names = _app.names else { return "" }
            return names.random()
        }
        
        public static func appVersion() -> String {
            guard let versions = _app.versions else { return "" }
            return numerify(versions.random())
        }
        
        public static func author() -> String {
            return _app.authors().random()
        }
    }
}