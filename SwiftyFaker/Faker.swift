//
//  Faker.swift
//  Gran Causa
//
//  Created by Jim Schultz on 9/16/15.
//  Copyright (c) 2015 Gran Causa. All rights reserved.
//

import UIKit

extension Int {
    static func random(range: Range<Int> ) -> Int {
        var offset = 0
        
        if range.startIndex < 0 {
            offset = abs(range.startIndex)
        }
        
        let min = UInt32(range.startIndex + offset)
        let max = UInt32(range.endIndex   + offset)
        
        return Int(min + arc4random_uniform(max - min)) - offset
    }
}

extension Array {
    func random() -> Element {
        let randInt = Int.random(0...self.count)
        let obj = self[randInt]
        return obj
    }
}

public class Faker: NSObject {
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
