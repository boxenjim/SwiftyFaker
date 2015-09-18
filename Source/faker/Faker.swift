//
//  Faker.swift
//  Gran Causa
//
//  Created by Jim Schultz on 9/16/15.
//  Copyright (c) 2015 Gran Causa. All rights reserved.
//

import UIKit

class Faker: NSObject {
    internal init(dictionary: [String : AnyObject]) {
        super.init()
        self.setValuesForKeysWithDictionary(dictionary)
    }
    
    internal func update(dictionary: [String : AnyObject]) {
        setValuesForKeysWithDictionary(dictionary)
    }
    
    // MARK: NSKeyValueCoding
    internal override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        print("KEY: \(key) VALUE: \(value)")
    }
    
    // MARK: helpers
    internal static func nameJSON() -> [String : AnyObject] {
        guard let name = readjson("name") as? [String : AnyObject] else { return [String : AnyObject]() }
        return name
    }
    
    internal static func randObj(array: [AnyObject]) -> AnyObject {
        let randInt1 = randomInt(NSMakeRange(0, array.count))
        let obj = array[Int(randInt1)]
        return obj
    }
    
    internal static func randomInt(range: NSRange) -> Int {
        return Int(arc4random_uniform(UInt32(range.length)) + UInt32(range.location))
    }
    
    internal static func readjson(fileName: String) -> AnyObject? {
        do {
            if let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json") {
                let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                let jsonResult = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions())
                return jsonResult
            }
        } catch _ {}
        
        return nil
    }

}
