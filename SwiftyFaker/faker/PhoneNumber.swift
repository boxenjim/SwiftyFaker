//
//  PhoneNumber.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    open class PhoneNumber: Faker {
        fileprivate var areaCodes: [String]?
        fileprivate var exchangeCodes: [String]?
        
        // MARK: NSKeyValueCoding
        open override func setValue(_ value: Any?, forKey key: String) {
            if key == "area_code" {
                areaCodes = value as? [String]
            } else if key == "exchange_code" {
                exchangeCodes = value as? [String]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        fileprivate static let _phoneNumber = PhoneNumber(dictionary: Faker.JSON("phone_number"))
        
        // MARK: Private Methods
        fileprivate func phoneFormats() -> [String] {
            return cellFormats() + ["\(PhoneNumber.areaCode())-\(PhoneNumber.exchangeCode())-\(PhoneNumber.subscriberNumber()) x\(PhoneNumber.extensionNumber())",
            "(\(PhoneNumber.areaCode())) \(PhoneNumber.exchangeCode())-\(PhoneNumber.subscriberNumber()) x\(PhoneNumber.extensionNumber())",
            "1-\(PhoneNumber.areaCode())-\(PhoneNumber.exchangeCode())-\(PhoneNumber.subscriberNumber()) x\(PhoneNumber.extensionNumber())",
            "\(PhoneNumber.areaCode()).\(PhoneNumber.exchangeCode()).\(PhoneNumber.subscriberNumber()) x\(PhoneNumber.extensionNumber())",
            "\(PhoneNumber.areaCode())-\(PhoneNumber.exchangeCode())-\(PhoneNumber.subscriberNumber()) x\(PhoneNumber.extensionNumber())",
            "(\(PhoneNumber.areaCode())) \(PhoneNumber.exchangeCode())-\(PhoneNumber.subscriberNumber()) x\(PhoneNumber.extensionNumber())",
            "1-\(PhoneNumber.areaCode())-\(PhoneNumber.exchangeCode())-\(PhoneNumber.subscriberNumber()) x\(PhoneNumber.extensionNumber())",
            "\(PhoneNumber.areaCode()).\(PhoneNumber.exchangeCode()).\(PhoneNumber.subscriberNumber()) x\(PhoneNumber.extensionNumber())",
            "\(PhoneNumber.areaCode())-\(PhoneNumber.exchangeCode())-\(PhoneNumber.subscriberNumber()) x\(PhoneNumber.extensionNumber())",
            "(\(PhoneNumber.areaCode())) \(PhoneNumber.exchangeCode())-\(PhoneNumber.subscriberNumber()) x\(PhoneNumber.extensionNumber())",
            "1-\(PhoneNumber.areaCode())-\(PhoneNumber.exchangeCode())-\(PhoneNumber.subscriberNumber()) x\(PhoneNumber.extensionNumber())",
            "\(PhoneNumber.areaCode()).\(PhoneNumber.exchangeCode()).\(PhoneNumber.subscriberNumber()) x\(PhoneNumber.extensionNumber())"]
        }
        
        fileprivate func cellFormats() -> [String] {
            return ["\(PhoneNumber.areaCode())-\(PhoneNumber.exchangeCode())-\(PhoneNumber.subscriberNumber())",
                "(\(PhoneNumber.areaCode())) \(PhoneNumber.exchangeCode())-\(PhoneNumber.subscriberNumber())",
                "1-\(PhoneNumber.areaCode())-\(PhoneNumber.exchangeCode())-\(PhoneNumber.subscriberNumber())",
                "\(PhoneNumber.areaCode()).\(PhoneNumber.exchangeCode()).\(PhoneNumber.subscriberNumber())",
                "\(PhoneNumber.areaCode())-\(PhoneNumber.exchangeCode())-\(PhoneNumber.subscriberNumber())",
                "(\(PhoneNumber.areaCode())) \(PhoneNumber.exchangeCode())-\(PhoneNumber.subscriberNumber())",
                "1-\(PhoneNumber.areaCode())-\(PhoneNumber.exchangeCode())-\(PhoneNumber.subscriberNumber())",
                "\(PhoneNumber.areaCode()).\(PhoneNumber.exchangeCode()).\(PhoneNumber.subscriberNumber())"]
        }
        
        // MARK: Methods
        open static func phoneNumber() -> String {
            return numerify(_phoneNumber.phoneFormats().random())
        }
        
        open static func cellPhone() -> String {
            return numerify(_phoneNumber.cellFormats().random())
        }
        
        open static func areaCode() -> String {
            guard let codes = _phoneNumber.areaCodes else { return "" }
            return codes.random()
        }
        
        open static func exchangeCode() -> String {
            guard let codes = _phoneNumber.exchangeCodes else { return "" }
            return codes.random()
        }
        
        open static func subscriberNumber() -> String {
            return extensionNumber(4)
        }
        
        open static func extensionNumber(_ length: Int = 3) -> String {
            return numerify(numerifyable(length))
        }
    }
}
