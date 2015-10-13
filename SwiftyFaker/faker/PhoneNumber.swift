//
//  PhoneNumber.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    public class PhoneNumber: Faker {
        private var areaCodes: [String]?
        private var exchangeCodes: [String]?
        
        // MARK: NSKeyValueCoding
        public override func setValue(value: AnyObject?, forKey key: String) {
            if key == "area_code" {
                areaCodes = value as? [String]
            } else if key == "exchange_code" {
                exchangeCodes = value as? [String]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        private static let _phoneNumber = PhoneNumber(dictionary: Faker.JSON("phone_number"))
        
        // MARK: Private Methods
        private func phoneFormats() -> [String] {
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
        
        private func cellFormats() -> [String] {
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
        public static func phoneNumber() -> String {
            return numerify(_phoneNumber.phoneFormats().random())
        }
        
        public static func cellPhone() -> String {
            return numerify(_phoneNumber.cellFormats().random())
        }
        
        public static func areaCode() -> String {
            guard let codes = _phoneNumber.areaCodes else { return "" }
            return codes.random()
        }
        
        public static func exchangeCode() -> String {
            guard let codes = _phoneNumber.exchangeCodes else { return "" }
            return codes.random()
        }
        
        public static func subscriberNumber(length: Int = 4) -> String {
            return numerify(numerifyable(length))
        }
        
        public static func extensionNumber(length: Int = 3) -> String {
            return subscriberNumber(length)
        }
    }
}