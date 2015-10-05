//
//  Faker.swift
//  Gran Causa
//
//  Created by Jim Schultz on 9/16/15.
//  Copyright (c) 2015 Gran Causa. All rights reserved.
//

import UIKit

public class Faker: NSObject {
    internal static let ULetters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    internal static let Letters = Faker.ULetters + ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    static func numerify(numberString: String) -> String {
        let range = numberString.characters.startIndex...numberString.characters.startIndex
        let numString = numberString.stringByReplacingCharactersInRange(range, withString: "\(Int.random(1...9))")
        
        var numerifiedString = ""
        
        for character in numString.characters {
            if character == "#" {
                numerifiedString += "\(Int.random(0...9))"
            } else {
                numerifiedString.append(character)
            }
        }
        
        return numerifiedString
    }
    
    static func letterify(letterString: String) -> String {
        var string = ""
        for character in letterString.characters {
            if character == "?" {
                string += Faker.ULetters.random()
            }
            else {
                string.append(character)
            }
        }
        return string
    }
    
    static func bothify(string: String) -> String {
        return letterify(numerify(string))
    }
    
    
    internal init(dictionary: [String : AnyObject]) {
        super.init()
        self.setValuesForKeysWithDictionary(dictionary)
    }
    
    internal func update(dictionary: [String : AnyObject]) {
        setValuesForKeysWithDictionary(dictionary)
    }
    
    // MARK: NSKeyValueCoding
    public override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        print("KEY: \(key) VALUE: \(value)")
    }
    
    // MARK: helpers
    internal static func addressJSON() -> [String : AnyObject] {
        guard let name = readjson("address") as? [String : AnyObject] else { return [String : AnyObject]() }
        return name
    }
    
    internal static func appJSON() -> [String : AnyObject] {
        guard let app = readjson("app") as? [String : AnyObject] else { return [String : AnyObject]() }
        return app
    }
    
    internal static func companyJSON() -> [String : AnyObject] {
        guard let company = readjson("company") as? [String : AnyObject] else { return [String : AnyObject]() }
        return company
    }
    
    internal static func loremJSON() -> [String : AnyObject] {
        guard let name = readjson("lorem") as? [String : AnyObject] else { return [String : AnyObject]() }
        return name
    }
    
    internal static func nameJSON() -> [String : AnyObject] {
        guard let name = readjson("name") as? [String : AnyObject] else { return [String : AnyObject]() }
        return name
    }
    
    internal static func readjson(fileName: String) -> AnyObject? {
        do {
            if let path = NSBundle(forClass: self).pathForResource(fileName, ofType: "json") {
                let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                let jsonResult = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions())
                return jsonResult
            }
        } catch _ {}
        
        return nil
    }

}
