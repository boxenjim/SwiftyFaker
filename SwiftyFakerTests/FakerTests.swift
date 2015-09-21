//
//  FakerTests.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/21/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import XCTest
@testable import SwiftyFaker

class FakerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIntRandom() {
        let lowInt = Int.random(0...100)
        let highInt = Int.random(101...1000)
        
        let randInt = Int.random(lowInt...highInt)
        
        XCTAssertTrue(randInt >= lowInt && randInt <= highInt, "\(randInt) should be between \(lowInt) and \(highInt)")
    }
    
    func testArrayRandom() {
        let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
        let randomObj = array.random()
        
        XCTAssertTrue(array.contains(randomObj), "\(randomObj) should be in array")
    }
}
