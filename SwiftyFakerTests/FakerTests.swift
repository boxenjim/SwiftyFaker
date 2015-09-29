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
    
    func testNumerify() {
        XCTAssertFalse(Faker.numerify("####").containsString("#"), "should not contain #")
    }
    
    func testLetterify() {
        XCTAssertFalse(Faker.letterify("????").containsString("?"), "should not contain ?")
    }
    
    func testBothify() {
        XCTAssertFalse(Faker.bothify("????####").containsString("?"), "should not contain ?")
        XCTAssertFalse(Faker.bothify("????####").containsString("#"), "should not contain #")
    }
}
