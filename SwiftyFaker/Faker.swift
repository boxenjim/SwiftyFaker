//
//  Faker.swift
//  Gran Causa
//
//  Created by Jim Schultz on 9/16/15.
//  Copyright (c) 2015 Jim Schultz. All rights reserved.
//

import Foundation

public class Faker: NSObject {
    internal static let ULetters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    internal static let LLetters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    internal static let Numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    internal static let Letters = Faker.ULetters + Faker.LLetters
    internal static let NumbersLetters = Faker.Numbers + Faker.Letters
    
    private static func ifyable(length: Int, typeString: String) -> String {
        var string = ""
        for _ in 0..<length {
            string += typeString
        }
        return string
    }
    
    static func numerifyable(length: Int) -> String {
        return ifyable(length, typeString: "#")
    }
    
    static func letterifyable(length: Int) -> String {
        return ifyable(length, typeString: "?")
    }
    
    static func numerify(numberString: String, intConvertable: Bool = true) -> String {
        let range = numberString.characters.startIndex...numberString.characters.startIndex
        var numberString = numberString
        
        if intConvertable && numberString.characters.first == "#" {
            numberString = numberString.stringByReplacingCharactersInRange(range, withString: "\(Int.random(1...9))")
        }
        
        var numerifiedString = ""
        
        for character in numberString.characters {
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
    internal static func JSON(key: String) -> [String : AnyObject] {
        guard let app = readjson(key) as? [String : AnyObject] else { return [String : AnyObject]() }
        return app
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
