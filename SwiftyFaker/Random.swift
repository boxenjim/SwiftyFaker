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
func arc4random <T: ExpressibleByIntegerLiteral> (_ type: T.Type) -> T {
    var r: T = 0
    arc4random_buf(&r, MemoryLayout<T>.size)
    return r
}

extension UInt64 {
    static func random(_ lower: UInt64 = min, upper: UInt64 = max) -> UInt64 {
        var m: UInt64
        let u = upper - lower
        var r = arc4random(UInt64.self)
        
        if u > UInt64(Int64.max) {
            m = 1 + ~u
        } else {
            m = ((max - (u * 2)) + 1) % u
        }
        
        while r < m {
            r = arc4random(UInt64.self)
        }
        
        return (r % u) + lower
    }
}

extension Int64 {
    static func random(_ lower: Int64 = min, upper: Int64 = max) -> Int64 {
        let (s, overflow) = upper.subtractingReportingOverflow(lower)
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
    static func random(_ lower: UInt32 = min, upper: UInt32 = max) -> UInt32 {
        return arc4random_uniform(upper - lower) + lower
    }
}

extension Int32 {
    static func random(_ lower: Int32 = min, upper: Int32 = max) -> Int32 {
        let r = arc4random_uniform(UInt32(Int64(upper) - Int64(lower)))
        return Int32(Int64(r) + Int64(lower))
    }
}

extension UInt {
    static func random(_ lower: UInt = min, upper: UInt = max) -> UInt {
        switch (__WORDSIZE) {
        case 32: return UInt(UInt32.random(UInt32(lower), upper: UInt32(upper)))
        case 64: return UInt(UInt64.random(UInt64(lower), upper: UInt64(upper)))
        default: return lower
        }
    }
}

extension Int {
    static func random(_ lower: Int = min, upper: Int = max) -> Int {
        switch (__WORDSIZE) {
        case 32: return Int(Int32.random(Int32(lower), upper: Int32(upper)))
        case 64: return Int(Int64.random(Int64(lower), upper: Int64(upper)))
        default: return lower
        }
    }
}

public extension Int {
    public static func random(_ range: Range<Int>) -> Int {
        let offset = range.lowerBound < 0 ? abs(range.lowerBound) : 0
        let min = UInt32(range.lowerBound + offset)
        let max = UInt32(range.upperBound + offset)
        return Int(min + arc4random_uniform(max - min)) - offset
    }
    
    public static func random(_ digits: Int) -> Int {
        let min = getMin(digits)
        let max = getMax(digits)
        return Int.random(min, upper: max)
    }
    
    fileprivate static func getMin(_ digits: Int) -> Int {
        var strng = "1"
        let absMax = UInt.max
        let maxCount = "\(absMax)".characters.count
        let adjCount = digits > maxCount ? maxCount : digits
        
        for _ in 1..<adjCount {
            strng += "0"
        }
        return Int(strng)!
    }
    
    fileprivate static func getMax(_ digits: Int) -> Int {
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
    public static func random(_ min: Double = 0.0, max: Double = 1.0) -> Double {
        let offset = min < 0.0 ? Swift.abs(min) : 0.0
        let low = min + offset
        let high = max + offset
        let r = Double(arc4random(UInt64.self)) / Double(UInt64.max)
        return ((r * (high - low)) + low) - offset
    }
}

public extension Float {
    public static func random(_ min: Float = 0.0, max: Float = 1.0) -> Float {
        let offset = min < 0.0 ? Swift.abs(min) : Float(0.0)
        let low = min + offset
        let high = max + offset
        let r = Float(arc4random(UInt32.self)) / Float(UInt32.max)
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
