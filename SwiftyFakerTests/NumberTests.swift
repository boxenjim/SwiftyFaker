//
//  NumberTests.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 10/14/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import XCTest
@testable import SwiftyFaker

class NumberTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNumber() {
        let number = Faker.Number.number()
        XCTAssertEqual(5, "\(number)".characters.count, "number digit count should match 5")
    }
    
    func testNumberWithDigits() {
        let digits = Int.random(1...10)
        let number = Faker.Number.number(digits)
        XCTAssertEqual(digits, "\(number)".characters.count, "number digit count should match \(digits)")
    }
    
    func testDecimal() {
        let digits = Int.random(1...10)
        let number = Faker.Number.decimal(digits)
        let comps = "\(number)".componentsSeparatedByString(".")
        XCTAssertEqual(comps.first?.characters.count, digits, "digits count should match \(digits)")
        XCTAssertEqual(comps.last?.characters.count, 2, "digit after decimal count should match 2")
    }
    
    func testDecimalWithAfterDigits() {
        let digits = Int.random(1...10)
        let afterDigits = Int.random(1...(15-digits))
        let number = Faker.Number.decimal(digits, digitsAfter: afterDigits)
        let comps = "\(number)".componentsSeparatedByString(".")
        XCTAssertEqual(comps.first?.characters.count, digits, "digits count should match \(digits)")
        XCTAssertEqual(comps.last?.characters.count, afterDigits, "digit after decimal count should match \(afterDigits)")
    }
    
    func testHexadecimal() {
        
    }
    
    func testBetweenInts() {
        let min = Int.random(0...100)
        let max = Int.random(min...200)
        let num = Faker.Number.between(min...max)
        XCTAssertTrue(num >= min && num <= max, "betweenInt should be between \(min) and \(max)")
    }
    
    func testBetweenDoubles() {
        let min = Double.random(0.0, max: 100.0)
        let max = Double.random(min, max: 200.0)
        let num = Faker.Number.between(min, max: max)
        XCTAssertTrue(num >= min && num <= max, "betweenDouble should be between \(min) and \(max)")
    }
    
    func testPositive() {
        let num = Faker.Number.positive()
        XCTAssertTrue(num > 0, "positive should be > 0")
    }
    
    func testNegative() {
        let num = Faker.Number.negative()
        XCTAssertTrue(num < 0, "negative should be < 0")
    }
    
    func testDigit() {
        let digit = Faker.Number.digit()
        XCTAssertTrue(digit >= 0 && digit <= 9, "digit should be between 0 and 9")
    }
}
