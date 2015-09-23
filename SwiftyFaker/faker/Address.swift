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
        private var city_prefixes: [String]?
        private var city_suffixes: [String]?
        private var countries: [String]?
        private var country_codes: [String]?
        private var building_numbers: [String]?
        private var street_suffixes: [String]?
        private var secondary_addresses: [String]?
        private var postcodes: [String]?
        private var postcodes_by_state: [String]?
        private var states: [String]?
        private var states_abbr: [String]?
        private var time_zones: [String]?
        
        private static let sharedAddress = Address(dictionary: Faker.addressJSON())
        
        // MARK: NSKeyValueCoding
        public override func setValue(value: AnyObject?, forKey key: String) {
            if key == "city_prefix" {
                city_prefixes = value as? [String]
            } else if key == "city_suffix" {
                city_suffixes = value as? [String]
            } else if key == "country" {
                countries = value as? [String]
            } else if key == "country_code" {
                country_codes = value as? [String]
            } else if key == "building_number" {
                building_numbers = value as? [String]
            } else if key == "street_suffix" {
                street_suffixes = value as? [String]
            } else if key == "secondary_address" {
                secondary_addresses = value as? [String]
            } else if key == "postcode" {
                postcodes = value as? [String]
            } else if key == "postcode_by_state" {
                postcodes_by_state = value as? [String]
            } else if key == "state" {
                states = value as? [String]
            } else if key == "state_abbr" {
                states_abbr = value as? [String]
            } else if key == "time_zone" {
                time_zones = value as? [String]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        // MARK: methods
        public static func city() -> String {
            return ""
        }
        
        public static func streetName() -> String {
            return ""
        }
        
        public static func streetAddress() -> String {
            return ""
        }
        
        public static func secondaryAddress() -> String {
            return ""
        }
        
        public static func buildingNumber() -> String {
            return ""
        }
        
        public static func timezone() -> String {
            return ""
        }
        
        public static func latitude() -> String {
            let lat = ((Double.random() * 180.0) - 90.0)
            return "\(lat)"
        }
        
        public static func longitude() -> String {
            let lon = ((Double.random() * 360.0) - 180.0)
            return "\(lon)"
        }
        
//        city:
//        - "#{city_prefix} #{Name.first_name}#{city_suffix}"
//        - "#{city_prefix} #{Name.first_name}"
//        - "#{Name.first_name}#{city_suffix}"
//        - "#{Name.last_name}#{city_suffix}"
//        street_name:
//        - "#{Name.first_name} #{street_suffix}"
//        - "#{Name.last_name} #{street_suffix}"
//        street_address:
//        - "#{building_number} #{street_name}"
//        default_country: [United States of America]
//
//
//        alias_method :zip, :zip_code
//        alias_method :postcode, :zip_code
//        
//        def street_suffix; fetch('address.street_suffix'); end
//        def city_suffix;   fetch('address.city_suffix');   end
//        def city_prefix;   fetch('address.city_prefix');   end
//        def state_abbr;    fetch('address.state_abbr');    end
//        def state;         fetch('address.state');         end
//        def country;       fetch('address.country');       end
//        def country_code;  fetch('address.country_code');  end
    }
}