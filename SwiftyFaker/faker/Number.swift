//
//  Number.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    open class Number: Faker {
        // MARK: Methods
        open static func number(_ digits: Int = 5) -> Int {
            return Int.random(digits)
        }
        
        open static func decimal(_ digits: Int, digitsAfter: Int = 2) -> Double {
            let rand = Double.random()
            let digitRand = rand * pow(Double(10), Double(digits + digitsAfter))
            let floorRand = floor(digitRand)
            let afterDigitRand = floorRand / pow(Double(10), Double(digitsAfter))
            return afterDigitRand
        }
        
        open static func hexadecimal(_ length: Int) -> String {
            return ""
        }
        
        open static func between(_ range: Range<Int>) -> Int {
            return Int.random(range)
        }
        
        open static func between(_ min: Double, max: Double) -> Double {
            return Double.random(min, max: max)
        }
        
        open static func positive() -> Double {
            return between(1.00, max: 5000.00)
        }
        
        open static func negative() -> Double {
            return between(-5000.00, max: -1.00)
        }
        
        open static func digit() -> Int {
            return between(0..<10)
        }
    }
}
