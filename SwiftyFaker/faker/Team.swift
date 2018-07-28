//
//  Team.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    open class Team: Faker {
        fileprivate var creatures: [String]?
        fileprivate var sports: [String]?
        
        // MARK: NSKeyValueCoding
        open override func setValue(_ value: Any?, forKey key: String) {
            if key == "creature" {
                creatures = value as? [String]
            } else if key == "sport" {
                sports = value as? [String]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        fileprivate static let _team = Team(dictionary: Faker.JSON("team"))
        
        // MARK: Private Methods
        fileprivate func names() -> [String] {
            return ["\(Team.state()) \(Team.creature())"]
        }
        
        // MARK: Methods
        open static func creature() -> String {
            guard let creatures = _team.creatures else { return "" }
            return creatures.random()
        }
        
        open static func name() -> String {
            return _team.names().random()
        }
        
        open static func sport() -> String {
            guard let sports = _team.sports else { return "" }
            return sports.random()
        }
        
        open static func state() -> String {
            return Address.state()
        }
    }
}
