//
//  RandomNumbersTests.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/23/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import XCTest
@testable import SwiftyFaker

class RandomNumbersTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIntRandom() {
        let low = Int.random(0...100)
        let high = Int.random(101...1000)
        
        let rand = Int.random(low...high)
        
        XCTAssertTrue(rand >= low && rand <= high, "\(rand) should be between \(low) and \(high)")
    }
    
    func testDoubleRandom() {
        let low = Double.random(0.0, max: 0.5)
        let high = Double.random(0.51, max: 1.0)
        
        let rand = Double.random(low, max: high)
        
        XCTAssertTrue(rand >= low && rand <= high, "\(rand) should be between \(low) and \(high)")
    }
    
    func testFloatRandom() {
        let low = Float.random(0.0, max: 0.5)
        let high = Float.random(0.51, max: 1.0)
        
        let rand = Float.random(low, max: high)
        
        XCTAssertTrue(rand >= low && rand <= high, "\(rand) should be between \(low) and \(high)")
    }
    
    func testArrayRandom() {
        let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
        let randomObj = array.random()
        
        XCTAssertTrue(array.contains(randomObj), "\(randomObj) should be in array")
    }
}
