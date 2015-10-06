//
//  Business.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    public class Business: Faker {
        private var credit_card_numbers: [String]?
        private var credit_card_types: [String]?
        
        // MARK: NSKeyValueCoding
        public override func setValue(value: AnyObject?, forKey key: String) {
            if key == "credit_card_numbers" {
                credit_card_numbers = value as? [String]
            } else if key == "credit_card_types" {
                credit_card_types = value as? [String]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        private static let _business = Business(dictionary: Faker.JSON("business"))
        
        // MARK: Methods
        public static func creditCardNumber() -> String {
            guard let numbers = _business.credit_card_numbers else { return "" }
            return numbers.random()
        }
        
        public static func creditCardExpiry() -> NSDate {
            let normalizedNow = NSCalendar.currentCalendar().startOfDayForDate(NSDate())
            guard let expiry = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Year, value: Int.random(1...4), toDate: normalizedNow, options: NSCalendarOptions()) else { return NSDate() }
            return expiry
        }
        
        public static func creditCardType() -> String {
            guard let types = _business.credit_card_types else { return "" }
            return types.random()
        }
    }
}