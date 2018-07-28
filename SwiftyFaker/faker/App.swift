//
//  App.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    open class App: Faker {
        fileprivate var names: [String]?
        fileprivate var versions: [String]?
        
        // MARK: NSKeyValueCoding
        open override func setValue(_ value: Any?, forKey key: String) {
            if key == "name" {
                names = value as? [String]
            } else if key == "version" {
                versions = value as? [String]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        fileprivate static let _app = App(dictionary: Faker.JSON("app"))
        
        // MARK: Private Address methods
        fileprivate func authors() -> [String] {
            return ["\(Name.name())", "\(Company.name())"]
        }
        
        // MARK: Methods
        open static func name() -> String {
            guard let names = _app.names else { return "" }
            return names.random()
        }
        
        open static func appVersion() -> String {
            guard let versions = _app.versions else { return "" }
            return numerify(versions.random())
        }
        
        open static func author() -> String {
            return _app.authors().random()
        }
    }
}
