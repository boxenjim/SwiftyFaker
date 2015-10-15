//
//  Number.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import Foundation

extension Faker {
    public class Number: Faker {
        // MARK: Methods
        public static func number(digits: Int = 5) -> Int {
            return Int.random(digits)
        }
        
        public static func decimal(digits: Int, digitsAfter: Int = 2) -> Double {
            let rand = Double.random()
            let digitRand = rand * pow(Double(10), Double(digits + digitsAfter))
            let floorRand = floor(digitRand)
            let afterDigitRand = floorRand / pow(Double(10), Double(digitsAfter))
            return afterDigitRand
        }
        
        public static func hexadecimal(length: Int) -> String {
            return ""
        }
        
        public static func between(range: Range<Int>) -> Int {
            return Int.random(range)
        }
        
        public static func between(min: Double, max: Double) -> Double {
            return Double.random(min, max: max)
        }
        
        public static func positive() -> Double {
            return between(1.00, max: 5000.00)
        }
        
        public static func negative() -> Double {
            return between(-5000.00, max: -1.00)
        }
        
        public static func digit() -> Int {
            return between(0...9)
        }
    }
}