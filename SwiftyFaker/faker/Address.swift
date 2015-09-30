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
        private var cities = ["\(Address.cityPrefix()) \(Name.firstName())\(Address.citySuffix())", "\(Address.cityPrefix()) \(Name.firstName())", "\(Name.firstName())\(Address.citySuffix())", "\(Name.lastName())\(Address.citySuffix())"]
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
        private var street_addresses = ["\(Address.buildingNumber()) \(Address.streetName())"]
        private var street_names = ["\(Name.firstName()) \(Address.citySuffix())", "\(Name.lastName()) \(Address.citySuffix())"]
        private var street_suffixes: [String]?
        private var time_zones: [String]?
        
        private static let sharedAddress = Address(dictionary: Faker.addressJSON())
        
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
        
        // MARK: Address methods
        public static func buildingNumber() -> String {
            guard let buildingNumber = sharedAddress.building_numbers?.random() else { return "" }
            return numerify(buildingNumber)
        }
        
        public static func city() -> String {
            return sharedAddress.cities.random()
        }
        
        public static func cityPrefix() -> String {
            guard let prefixes = sharedAddress.city_prefixes else { return "" }
            return prefixes.random()
        }
        
        public static func citySuffix() -> String {
            guard let suffixes = sharedAddress.city_suffixes else { return "" }
            return suffixes.random()
        }
        
        public static func country() -> String {
            guard let country = sharedAddress.countries?.random() else { return "" }
            return country
        }
        
        public static func countryCode() -> String {
            guard let countryCode = sharedAddress.country_codes?.random() else { return "" }
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
            guard let secondaryAddress = sharedAddress.secondary_addresses?.random() else { return "" }
            return numerify(secondaryAddress)
        }
        
        public static func state() -> String {
            guard let state = sharedAddress.states?.random() else { return "" }
            return state
        }
        
        public static func stateAbbr() -> String {
            guard let stateAbbr = sharedAddress.states_abbr?.random() else { return "" }
            return stateAbbr
        }
        
        public static func streetAddress(includeSecondary: Bool = false) -> String {
            return numerify(sharedAddress.street_addresses.random() + (includeSecondary ? " " + secondaryAddress() : ""))
        }
        
        public static func streetName() -> String {
            return sharedAddress.street_names.random()
        }
        
        public static func streetSuffix() -> String {
            guard let streetSuffixes = sharedAddress.street_suffixes else { return "" }
            return streetSuffixes.random()
        }
        
        public static func timezone() -> String {
            guard let timezones = sharedAddress.time_zones else { return "" }
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
                guard let postCode = sharedAddress.postcodes?.random() else { return "" }
                return bothify(postCode)
            }
            
            guard let postCode = sharedAddress.postcodes_by_state?.random() else { return "" }
            return bothify(postCode + stateAbbreviation)
        }
    }
}