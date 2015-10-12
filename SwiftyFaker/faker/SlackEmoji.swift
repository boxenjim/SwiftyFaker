//
//  SlackEmoji.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    public class SlackEmoji: Faker {
        private var _people: [String]?
        private var _nature: [String]?
        private var _food_and_drink: [String]?
        private var _celebration: [String]?
        private var _activity: [String]?
        private var _travel_and_places: [String]?
        private var _objects_and_symbols: [String]?
        private var _custom: [String]?
        
        // MARK: NSKeyValueCoding
        public override func setValue(value: AnyObject?, forKey key: String) {
            if key == "people" {
                _people = value as? [String]
            } else if key == "nature" {
                _nature = value as? [String]
            } else if key == "food_and_drink" {
                _food_and_drink = value as? [String]
            } else if key == "celebration" {
                _celebration = value as? [String]
            } else if key == "activity" {
                _activity = value as? [String]
            } else if key == "travel_and_places" {
                _travel_and_places = value as? [String]
            } else if key == "objects_and_symbols" {
                _objects_and_symbols = value as? [String]
            } else if key == "custom" {
                _custom = value as? [String]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        private static let _slackEmoji = SlackEmoji(dictionary: Faker.JSON("slack_emoji"))
        
        // MARK: Private methods
        private func _emoji() -> [String] {
            return ["\(SlackEmoji.people())", "\(SlackEmoji.nature())", "\(SlackEmoji.foodAndDrink())", "\(SlackEmoji.celebration())", "\(SlackEmoji.activity())", "\(SlackEmoji.travelAndPlaces())", "\(SlackEmoji.objectsAndSymbols())", "\(SlackEmoji.custom())"]
        }
        
        // MARK: Methods
        public static func people() -> String  {
            guard let people = _slackEmoji._people else { return "" }
            return people.random()
        }
        
        public static func nature() -> String  {
            guard let nature = _slackEmoji._nature else { return "" }
            return nature.random()
        }
        
        public static func foodAndDrink() -> String  {
            guard let fdDrnk = _slackEmoji._food_and_drink else { return "" }
            return fdDrnk.random()
        }
        
        public static func celebration() -> String  {
            guard let celebration = _slackEmoji._celebration else { return "" }
            return celebration.random()
        }
        
        public static func activity() -> String  {
            guard let activity = _slackEmoji._activity else { return "" }
            return activity.random()
        }
        
        public static func travelAndPlaces() -> String  {
            guard let trvPlcs = _slackEmoji._travel_and_places else { return "" }
            return trvPlcs.random()
        }
        
        public static func objectsAndSymbols() -> String  {
            guard let objsSymbs = _slackEmoji._objects_and_symbols else { return "" }
            return objsSymbs.random()
        }
        
        public static func custom() -> String  {
            guard let custom = _slackEmoji._custom else { return "" }
            return custom.random()
        }
        
        public static func emoji() -> String {
            return _slackEmoji._emoji().random()
        }
    }
}