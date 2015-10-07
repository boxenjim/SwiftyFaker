//
//  UniversityTests.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 10/7/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import XCTest
@testable import SwiftyFaker

class UniversityTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testName() {
        let name = Faker.University.name()
        XCTAssertFalse(name.isEmpty, "name should not be empty")
    }
    
    func testPrefix() {
        let prefix = Faker.University.prefix()
        XCTAssertFalse(prefix.isEmpty, "prefix should not be empty")
    }
    
    func testSuffix() {
        let suffix = Faker.University.suffix()
        XCTAssertFalse(suffix.isEmpty, "suffix should not be empty")
    }
    
}
