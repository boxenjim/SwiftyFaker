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
    
    func testRandInt() {
        let lowInt = Faker.randomInt(NSMakeRange(0, 100))
        let highInt = Faker.randomInt(NSMakeRange(101, 1000))
        
        let randInt = Faker.randomInt(NSMakeRange(lowInt, highInt))
        
        XCTAssertTrue(randInt >= lowInt && randInt <= highInt, "should be between \(lowInt) and \(highInt)")
    }
}
