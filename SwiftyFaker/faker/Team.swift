//
//  Team.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    public class Team: Faker {
        private var creatures: [String]?
        private var sports: [String]?
        
        // MARK: NSKeyValueCoding
        public override func setValue(value: AnyObject?, forKey key: String) {
            if key == "creature" {
                creatures = value as? [String]
            } else if key == "sport" {
                sports = value as? [String]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        private static let _team = Team(dictionary: Faker.JSON("team"))
        
        // MARK: Private Methods
        private func names() -> [String] {
            return ["\(Team.state()) \(Team.creature())"]
        }
        
        // MARK: Methods
        public static func creature() -> String {
            guard let creatures = _team.creatures else { return "" }
            return creatures.random()
        }
        
        public static func name() -> String {
            return _team.names().random()
        }
        
        public static func sport() -> String {
            guard let sports = _team.sports else { return "" }
            return sports.random()
        }
        
        public static func state() -> String {
            return Address.state()
        }
    }
}