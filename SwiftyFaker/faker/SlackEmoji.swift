//
//  SlackEmoji.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    open class SlackEmoji: Faker {
        fileprivate var _people: [String]?
        fileprivate var _nature: [String]?
        fileprivate var _food_and_drink: [String]?
        fileprivate var _celebration: [String]?
        fileprivate var _activity: [String]?
        fileprivate var _travel_and_places: [String]?
        fileprivate var _objects_and_symbols: [String]?
        fileprivate var _custom: [String]?
        
        // MARK: NSKeyValueCoding
        open override func setValue(_ value: Any?, forKey key: String) {
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
        
        fileprivate static let _slackEmoji = SlackEmoji(dictionary: Faker.JSON("slack_emoji"))
        
        // MARK: Private methods
        fileprivate func _emoji() -> [String] {
            return ["\(SlackEmoji.people())", "\(SlackEmoji.nature())", "\(SlackEmoji.foodAndDrink())", "\(SlackEmoji.celebration())", "\(SlackEmoji.activity())", "\(SlackEmoji.travelAndPlaces())", "\(SlackEmoji.objectsAndSymbols())", "\(SlackEmoji.custom())"]
        }
        
        // MARK: Methods
        open static func people() -> String  {
            guard let people = _slackEmoji._people else { return "" }
            return people.random()
        }
        
        open static func nature() -> String  {
            guard let nature = _slackEmoji._nature else { return "" }
            return nature.random()
        }
        
        open static func foodAndDrink() -> String  {
            guard let fdDrnk = _slackEmoji._food_and_drink else { return "" }
            return fdDrnk.random()
        }
        
        open static func celebration() -> String  {
            guard let celebration = _slackEmoji._celebration else { return "" }
            return celebration.random()
        }
        
        open static func activity() -> String  {
            guard let activity = _slackEmoji._activity else { return "" }
            return activity.random()
        }
        
        open static func travelAndPlaces() -> String  {
            guard let trvPlcs = _slackEmoji._travel_and_places else { return "" }
            return trvPlcs.random()
        }
        
        open static func objectsAndSymbols() -> String  {
            guard let objsSymbs = _slackEmoji._objects_and_symbols else { return "" }
            return objsSymbs.random()
        }
        
        open static func custom() -> String  {
            guard let custom = _slackEmoji._custom else { return "" }
            return custom.random()
        }
        
        open static func emoji() -> String {
            return _slackEmoji._emoji().random()
        }
    }
}
