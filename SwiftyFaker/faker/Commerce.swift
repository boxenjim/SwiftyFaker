//
//  Commerce.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    open class Commerce: Faker {
        fileprivate var colors: [String]?
        fileprivate var departments: [String]?
        fileprivate var productNames: [String : AnyObject]?
        
        fileprivate var adjectives: [String]? {
            return productNames?["adjective"] as? [String]
        }
        
        fileprivate var materials: [String]? {
            return productNames?["material"] as? [String]
        }
        
        fileprivate var products: [String]? {
            return productNames?["product"] as? [String]
        }
        
        // MARK: NSKeyValueCoding
        open override func setValue(_ value: Any?, forKey key: String) {
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
        
        fileprivate static let _commerce = Commerce(dictionary: Faker.JSON("commerce"))
        
        // MARK: Methods
        open static func color() -> String {
            guard let colors = _commerce.colors else { return "" }
            return colors.random()
        }
        
        open static func department(_ max: Int = 3, fixedAmount: Bool = false) -> String {
            let num = fixedAmount ? max : 1 + Int.random(0..<max+1)
            let cats = categories(num)
            return mergeCategories(cats)
        }
        
        open static func productName() -> String {
            return "\(adjective()) \(material()) \(product())"
        }
        
        open static func material() -> String {
            guard let materials = _commerce.materials else { return "" }
            return materials.random()
        }
        
        open static func product() -> String {
            guard let products = _commerce.products else { return "" }
            return products.random()
        }
        
        open static func price() -> Double {
            let rand = floor(Double.random(0, max: 100.0) * 100)/100.0
            return rand
        }
        
        // MARK: Private methods
        fileprivate static func adjective() -> String {
            guard let adjectives = _commerce.adjectives else { return "" }
            return adjectives.random()
        }
        
        fileprivate static func categories(_ num: Int) -> [String] {
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
        
        fileprivate static func mergeCategories(_ categories: [String]) -> String {
            guard let last = categories.last else { return "" }
            if categories.count > 1 {
                let commaSep = categories[0..<categories.count-1].joined(separator: ", ")
                return commaSep + " & " + last
            }
            
            return last
        }
    }
}
