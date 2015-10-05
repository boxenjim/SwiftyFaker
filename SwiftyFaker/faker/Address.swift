//
//  Address.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    public class Address: Faker {
        private var building_numbers: [String]?
        private var city_prefixes: [String]?
        private var city_suffixes: [String]?
        private var countries: [String]?
        private var country_codes: [String]?
        private var default_countries: [String]?
        private var postcodes: [String]?
        private var postcodes_by_state: [String]?
        private var secondary_addresses: [String]?
        private var states: [String]?
        private var states_abbr: [String]?
        private var street_suffixes: [String]?
        private var time_zones: [String]?
        
        // MARK: NSKeyValueCoding
        public override func setValue(value: AnyObject?, forKey key: String) {
            if key == "building_number" {
                building_numbers = value as? [String]
            } else if key == "city_prefix" {
                city_prefixes = value as? [String]
            } else if key == "city_suffix" {
                city_suffixes = value as? [String]
            } else if key == "country" {
                countries = value as? [String]
            } else if key == "country_code" {
                country_codes = value as? [String]
            } else if key == "default_county" {
                default_countries = value as? [String]
            } else if key == "postcode" {
                postcodes = value as? [String]
            } else if key == "postcode_by_state" {
                postcodes_by_state = value as? [String]
            } else if key == "secondary_address" {
                secondary_addresses = value as? [String]
            } else if key == "state" {
                states = value as? [String]
            } else if key == "state_abbr" {
                states_abbr = value as? [String]
            } else if key == "street_suffix" {
                street_suffixes = value as? [String]
            } else if key == "time_zone" {
                time_zones = value as? [String]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        private static let _address = Address(dictionary: Faker.JSON("address"))
        
        // MARK: Private Address methods
        private func cities() -> [String] {
            return ["\(Address.cityPrefix()) \(Name.firstName())\(Address.citySuffix())",
                "\(Address.cityPrefix()) \(Name.firstName())",
                "\(Name.firstName())\(Address.citySuffix())",
                "\(Name.lastName())\(Address.citySuffix())"]
        }
        
        private func street_addresses() -> [String] {
            return ["\(Address.buildingNumber()) \(Address.streetName())"]
        }
        
        private func street_names() -> [String] {
            return ["\(Name.firstName()) \(Address.streetSuffix())", "\(Name.lastName()) \(Address.streetSuffix())"]
        }
        
        // MARK: Public Address methods
        public static func buildingNumber() -> String {
            guard let buildingNumber = _address.building_numbers?.random() else { return "" }
            return numerify(buildingNumber)
        }
        
        public static func city() -> String {
            return _address.cities().random()
        }
        
        public static func cityPrefix() -> String {
            guard let prefixes = _address.city_prefixes else { return "" }
            return prefixes.random()
        }
        
        public static func citySuffix() -> String {
            guard let suffixes = _address.city_suffixes else { return "" }
            return suffixes.random()
        }
        
        public static func country() -> String {
            guard let country = _address.countries?.random() else { return "" }
            return country
        }
        
        public static func countryCode() -> String {
            guard let countryCode = _address.country_codes?.random() else { return "" }
            return countryCode
        }
        
        public static func latitude() -> String {
            let lat = ((Double.random() * 180.0) - 90.0)
            return "\(lat)"
        }
        
        public static func longitude() -> String {
            let lon = ((Double.random() * 360.0) - 180.0)
            return "\(lon)"
        }
        
        public static func postcode() -> String {
            return zipCode()
        }
        
        public static func secondaryAddress() -> String {
            guard let secondaryAddress = _address.secondary_addresses?.random() else { return "" }
            return numerify(secondaryAddress)
        }
        
        public static func state() -> String {
            guard let state = _address.states?.random() else { return "" }
            return state
        }
        
        public static func stateAbbr() -> String {
            guard let stateAbbr = _address.states_abbr?.random() else { return "" }
            return stateAbbr
        }
        
        public static func streetAddress(includeSecondary: Bool = false) -> String {
            let address = _address.street_addresses().random()
            return numerify(address + (includeSecondary ? " " + secondaryAddress() : ""))
        }
        
        public static func streetName() -> String {
            let name = _address.street_names().random()
            return name
        }
        
        public static func streetSuffix() -> String {
            guard let streetSuffixes = _address.street_suffixes else { return "" }
            return streetSuffixes.random()
        }
        
        public static func timezone() -> String {
            guard let timezones = _address.time_zones else { return "" }
            return timezones.random()
        }
        
        public static func zip() -> String {
            return zipCode()
        }
        
        /**
            provide a zip code that is valid for the state provided
            see http://www.fincen.gov/forms/files/us_state_territory_zip_codes.pdf
        */
        public static func zipCode(stateAbbreviation: String = "") -> String {
            if stateAbbreviation == "" {
                guard let postCode = _address.postcodes?.random() else { return "" }
                return bothify(postCode)
            }
            
            guard let postCode = _address.postcodes_by_state?.random() else { return "" }
            return bothify(postCode + stateAbbreviation)
        }
    }
}