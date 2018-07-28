//
//  Business.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    open class Business: Faker {
        fileprivate var credit_card_numbers: [String]?
        fileprivate var credit_card_types: [String]?
        
        // MARK: NSKeyValueCoding
        open override func setValue(_ value: Any?, forKey key: String) {
            if key == "credit_card_numbers" {
                credit_card_numbers = value as? [String]
            } else if key == "credit_card_types" {
                credit_card_types = value as? [String]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        fileprivate static let _business = Business(dictionary: Faker.JSON("business"))
        
        // MARK: Methods
        open static func creditCardNumber() -> String {
            guard let numbers = _business.credit_card_numbers else { return "" }
            return numbers.random()
        }
        
        open static func creditCardExpiry() -> Foundation.Date {
            let normalizedNow = Calendar.current.startOfDay(for: Foundation.Date())
            guard let expiry = (Calendar.current as NSCalendar).date(byAdding: NSCalendar.Unit.year, value: Int.random(1..<5), to: normalizedNow, options: NSCalendar.Options()) else { return Foundation.Date() }
            return expiry
        }
        
        open static func creditCardType() -> String {
            guard let types = _business.credit_card_types else { return "" }
            return types.random()
        }
    }
}
