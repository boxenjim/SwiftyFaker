//
//  Address.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    open class Address: Faker {
        fileprivate var building_numbers: [String]?
        fileprivate var city_prefixes: [String]?
        fileprivate var city_suffixes: [String]?
        fileprivate var countries: [String]?
        fileprivate var country_codes: [String]?
        fileprivate var default_countries: [String]?
        fileprivate var postcodes: [String]?
        fileprivate var postcodes_by_state: [String : String]?
        fileprivate var secondary_addresses: [String]?
        fileprivate var states: [String]?
        fileprivate var states_abbr: [String]?
        fileprivate var street_suffixes: [String]?
        fileprivate var time_zones: [String]?
        
        // MARK: NSKeyValueCoding
        open override func setValue(_ value: Any?, forKey key: String) {
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
                postcodes_by_state = value as? [String : String]
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
        
        fileprivate static let _address = Address(dictionary: Faker.JSON("address"))
        
        // MARK: Private methods
        fileprivate func cities() -> [String] {
            return ["\(Address.cityPrefix()) \(Name.firstName())\(Address.citySuffix())",
                "\(Address.cityPrefix()) \(Name.firstName())",
                "\(Name.firstName())\(Address.citySuffix())",
                "\(Name.lastName())\(Address.citySuffix())"]
        }
        
        fileprivate func street_addresses() -> [String] {
            return ["\(Address.buildingNumber()) \(Address.streetName())"]
        }
        
        fileprivate func street_names() -> [String] {
            return ["\(Name.firstName()) \(Address.streetSuffix())", "\(Name.lastName()) \(Address.streetSuffix())"]
        }
        
        // MARK: Public Address methods
        open static func buildingNumber() -> String {
            guard let buildingNumber = _address.building_numbers?.random() else { return "" }
            return numerify(buildingNumber)
        }
        
        open static func city() -> String {
            return _address.cities().random()
        }
        
        open static func cityPrefix() -> String {
            guard let prefixes = _address.city_prefixes else { return "" }
            return prefixes.random()
        }
        
        open static func citySuffix() -> String {
            guard let suffixes = _address.city_suffixes else { return "" }
            return suffixes.random()
        }
        
        open static func country() -> String {
            guard let country = _address.countries?.random() else { return "" }
            return country
        }
        
        open static func countryCode() -> String {
            guard let countryCode = _address.country_codes?.random() else { return "" }
            return countryCode
        }
        
        open static func latitude() -> String {
            let lat = ((Double.random() * 180.0) - 90.0)
            return "\(lat)"
        }
        
        open static func longitude() -> String {
            let lon = ((Double.random() * 360.0) - 180.0)
            return "\(lon)"
        }
        
        open static func postcode() -> String {
            return zipCode()
        }
        
        open static func secondaryAddress() -> String {
            guard let secondaryAddress = _address.secondary_addresses?.random() else { return "" }
            return numerify(secondaryAddress)
        }
        
        open static func state() -> String {
            guard let state = _address.states?.random() else { return "" }
            return state
        }
        
        open static func stateAbbr() -> String {
            guard let stateAbbr = _address.states_abbr?.random() else { return "" }
            return stateAbbr
        }
        
        open static func streetAddress(_ includeSecondary: Bool = false) -> String {
            let address = _address.street_addresses().random()
            return numerify(address + (includeSecondary ? " " + secondaryAddress() : ""))
        }
        
        open static func streetName() -> String {
            let name = _address.street_names().random()
            return name
        }
        
        open static func streetSuffix() -> String {
            guard let streetSuffixes = _address.street_suffixes else { return "" }
            return streetSuffixes.random()
        }
        
        open static func timezone() -> String {
            guard let timezones = _address.time_zones else { return "" }
            return timezones.random()
        }
        
        open static func zip() -> String {
            return zipCode()
        }
        
        /**
            provide a zip code that is valid for the state provided
            see http://www.fincen.gov/forms/files/us_state_territory_zip_codes.pdf
        */
        open static func zipCode(_ stateAbbreviation: String? = nil) -> String {
            if stateAbbreviation == nil {
                guard let postCode = _address.postcodes?.random() else { return "" }
                return numerify(postCode)
            }
            
            guard let postCodes = _address.postcodes_by_state else { return "" }
            guard let postCode = postCodes[stateAbbreviation!.uppercased()] else { return "" }
            return numerify(postCode)
        }
    }
}
