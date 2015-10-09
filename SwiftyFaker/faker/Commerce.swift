//
//  Commerce.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    public class Commerce: Faker {
        private var colors: [String]?
        private var departments: [String]?
        private var productNames: [String : AnyObject]?
        
        private var adjectives: [String]? {
            return productNames?["adjective"] as? [String]
        }
        
        private var materials: [String]? {
            return productNames?["material"] as? [String]
        }
        
        private var products: [String]? {
            return productNames?["product"] as? [String]
        }
        
        // MARK: NSKeyValueCoding
        public override func setValue(value: AnyObject?, forKey key: String) {
            if key == "color" {
                colors = value as? [String]
            } else if key == "department" {
                departments = value as? [String]
            } else if key == "product_name" {
                productNames = value as? [String : AnyObject]
            } else {
                super.setValue(value, forKey: key)
            }
        }
        
        private static let _commerce = Commerce(dictionary: Faker.JSON("commerce"))
        
        // MARK: Methods
        public static func color() -> String {
            guard let colors = _commerce.colors else { return "" }
            return colors.random()
        }
        
        public static func department(max: Int = 3, fixedAmount: Bool = false) -> String {
            let num = fixedAmount ? max : 1 + Int.random(0...max)
            let cats = categories(num)
            return mergeCategories(cats)
        }
        
        public static func productName() -> String {
            return "\(adjective()) \(material()) \(product())"
        }
        
        public static func material() -> String {
            guard let materials = _commerce.materials else { return "" }
            return materials.random()
        }
        
        public static func product() -> String {
            guard let products = _commerce.products else { return "" }
            return products.random()
        }
        
        public static func price() -> Double {
            let rand = floor(Double.random(0, max: 100.0) * 100)/100.0
            return rand
        }
        
        // MARK: Private methods
        private static func adjective() -> String {
            guard let adjectives = _commerce.adjectives else { return "" }
            return adjectives.random()
        }
        
        private static func categories(num: Int) -> [String] {
            var cats = [String]()
            
            repeat {
                guard let categories = _commerce.departments else { break }
                let category = categories.random()
                if !(cats.contains(category)) {
                    cats.append(category)
                }
            } while cats.count < num
            
            return cats
        }
        
        private static func mergeCategories(categories: [String]) -> String {
            guard let last = categories.last else { return "" }
            if categories.count > 1 {
                let commaSep = categories[0..<categories.count-1].joinWithSeparator(", ")
                return commaSep + " & " + last
            }
            
            return last
        }
    }
}