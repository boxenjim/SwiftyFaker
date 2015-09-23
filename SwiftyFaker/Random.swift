//
//  RandomNumbers.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/23/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

/**
Arc Random for Double and Float
*/
public func arc4random <T: IntegerLiteralConvertible> (type: T.Type) -> T {
    var r: T = 0
    arc4random_buf(&r, sizeof(T))
    return r
}

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

extension Double {
    static func random(min: Double = 0.0, max: Double = 1.0) -> Double {
        var offset = 0.0
        
        if min < 0.0 {
            offset = abs(min)
        }
        
        let low = min + offset
        let high = max + offset
        
        let r = Double(arc4random(UInt64)) / Double(UInt64.max)
        return ((r * (high - low)) + low) - offset
    }
}

extension Float {
    static func random(min: Float = 0.0, max: Float = 1.0) -> Float {
        var offset = Float(0.0)
        
        if min < 0.0 {
            offset = abs(min)
        }
        
        let low = min + offset
        let high = max + offset
        
        let r = Float(arc4random(UInt32)) / Float(UInt32.max)
        return ((r * (high - low)) + low) - offset
    }
}

extension Array {
    func random() -> Element {
        let randInt = Int.random(0..<self.count)
        let obj = self[randInt]
        return obj
    }
}
