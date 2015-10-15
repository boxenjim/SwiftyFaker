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
func arc4random <T: IntegerLiteralConvertible> (type: T.Type) -> T {
    var r: T = 0
    arc4random_buf(&r, sizeof(T))
    return r
}

extension UInt64 {
    static func random(lower: UInt64 = min, upper: UInt64 = max) -> UInt64 {
        var m: UInt64
        let u = upper - lower
        var r = arc4random(UInt64)
        
        if u > UInt64(Int64.max) {
            m = 1 + ~u
        } else {
            m = ((max - (u * 2)) + 1) % u
        }
        
        while r < m {
            r = arc4random(UInt64)
        }
        
        return (r % u) + lower
    }
}

extension Int64 {
    static func random(lower: Int64 = min, upper: Int64 = max) -> Int64 {
        let (s, overflow) = Int64.subtractWithOverflow(upper, lower)
        let u = overflow ? UInt64.max - UInt64(~s) : UInt64(s)
        let r = UInt64.random(upper: u)
        
        if r > UInt64(Int64.max)  {
            return Int64(r - (UInt64(~lower) + 1))
        } else {
            return Int64(r) + lower
        }
    }
}

extension UInt32 {
    static func random(lower: UInt32 = min, upper: UInt32 = max) -> UInt32 {
        return arc4random_uniform(upper - lower) + lower
    }
}

extension Int32 {
    static func random(lower: Int32 = min, upper: Int32 = max) -> Int32 {
        let r = arc4random_uniform(UInt32(Int64(upper) - Int64(lower)))
        return Int32(Int64(r) + Int64(lower))
    }
}

extension UInt {
    static func random(lower: UInt = min, upper: UInt = max) -> UInt {
        switch (__WORDSIZE) {
        case 32: return UInt(UInt32.random(UInt32(lower), upper: UInt32(upper)))
        case 64: return UInt(UInt64.random(UInt64(lower), upper: UInt64(upper)))
        default: return lower
        }
    }
}

extension Int {
    static func random(lower: Int = min, upper: Int = max) -> Int {
        switch (__WORDSIZE) {
        case 32: return Int(Int32.random(Int32(lower), upper: Int32(upper)))
        case 64: return Int(Int64.random(Int64(lower), upper: Int64(upper)))
        default: return lower
        }
    }
}

public extension Int {
    public static func random(range: Range<Int>) -> Int {
        let offset = range.startIndex < 0 ? abs(range.startIndex) : 0
        let min = UInt32(range.startIndex + offset)
        let max = UInt32(range.endIndex + offset)
        return Int(min + arc4random_uniform(max - min)) - offset
    }
    
    public static func random(digits: Int) -> Int {
        let min = getMin(digits)
        let max = getMax(digits)
        return Int.random(min, upper: max)
    }
    
    private static func getMin(digits: Int) -> Int {
        var strng = "1"
        let absMax = UInt.max
        let maxCount = "\(absMax)".characters.count
        let adjCount = digits > maxCount ? maxCount : digits
        
        for _ in 1..<adjCount {
            strng += "0"
        }
        return Int(strng)!
    }
    
    private static func getMax(digits: Int) -> Int {
        var strng = ""
        let absMax = UInt.max
        if digits >= "\(absMax)".characters.count {
            strng = "\(UInt.max)"
        } else {
            for _ in 0..<digits {
                strng += "9"
            }
        }
        return Int(strng)!
    }
}

public extension Double {
    public static func random(min: Double = 0.0, max: Double = 1.0) -> Double {
        let offset = min < 0.0 ? abs(min) : 0.0
        let low = min + offset
        let high = max + offset
        let r = Double(arc4random(UInt64)) / Double(UInt64.max)
        return ((r * (high - low)) + low) - offset
    }
}

public extension Float {
    public static func random(min: Float = 0.0, max: Float = 1.0) -> Float {
        let offset = min < 0.0 ? abs(min) : Float(0.0)
        let low = min + offset
        let high = max + offset
        let r = Float(arc4random(UInt32)) / Float(UInt32.max)
        return ((r * (high - low)) + low) - offset
    }
}

public extension Array {
    public func random() -> Element {
        let randInt = Int.random(0..<self.count)
        let obj = self[randInt]
        return obj
    }
}
