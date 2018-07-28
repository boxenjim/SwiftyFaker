//
//  Faker.swift
//  Gran Causa
//
//  Created by Jim Schultz on 9/16/15.
//  Copyright (c) 2015 Jim Schultz. All rights reserved.
//

import Foundation

open class Faker: NSObject {
    internal static let ULetters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    internal static let LLetters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    internal static let Numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    internal static let Letters = Faker.ULetters + Faker.LLetters
    internal static let NumbersLetters = Faker.Numbers + Faker.Letters
    
    fileprivate static func ifyable(_ length: Int, typeString: String) -> String {
        var string = ""
        for _ in 0..<length {
            string += typeString
        }
        return string
    }
    
    static func numerifyable(_ length: Int) -> String {
        return ifyable(length, typeString: "#")
    }
    
    static func letterifyable(_ length: Int) -> String {
        return ifyable(length, typeString: "?")
    }
    
    static func numerify(_ numberString: String, intConvertable: Bool = true) -> String {
        let range = numberString.characters.startIndex...numberString.characters.startIndex
        var numberString = numberString
        
        if intConvertable && numberString.characters.first == "#" {
            numberString = numberString.replacingCharacters(in: range, with: "\(Int.random(1...9))")
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
    
    static func letterify(_ letterString: String) -> String {
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
    
    static func bothify(_ string: String) -> String {
        return letterify(numerify(string))
    }
    
    
    internal init(dictionary: [String : AnyObject]) {
        super.init()
        self.setValuesForKeys(dictionary)
    }
    
    internal func update(_ dictionary: [String : AnyObject]) {
        setValuesForKeys(dictionary)
    }
    
    // MARK: NSKeyValueCoding
    open override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("KEY: \(key) VALUE: \(value)")
    }
    
    // MARK: helpers
    internal static func JSON(_ key: String) -> [String : AnyObject] {
        guard let app = readjson(key) as? [String : AnyObject] else { return [String : AnyObject]() }
        return app
    }
    
    internal static func readjson(_ fileName: String) -> AnyObject? {
        do {
            if let path = Bundle(for: self).path(forResource: fileName, ofType: "json") {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: NSData.ReadingOptions.mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions())
                return jsonResult as AnyObject
            }
        } catch _ {}
        
        return nil
    }

}
