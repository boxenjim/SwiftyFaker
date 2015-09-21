//
//  NameTests.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/18/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import XCTest
@testable import SwiftyFaker

class NameTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testName() {
        let name = Faker.Name.name()
        XCTAssertFalse(name.isEmpty, "name shouldn't be empty")
    }
    
    func testFirstName() {
        let firstName = Faker.Name.name()
        XCTAssertFalse(firstName.isEmpty, "firstName shouldn't be empty")
    }
    
    func testLastName() {
        let lastName = Faker.Name.name()
        XCTAssertFalse(lastName.isEmpty, "lastName shouldn't be empty")
    }
    
    func testPrefix() {
        let prefix = Faker.Name.prefix()
        XCTAssertFalse(prefix.isEmpty, "prefix shouldn't be empty")
    }
    
    func testSuffix() {
        let suffix = Faker.Name.suffix()
        XCTAssertFalse(suffix.isEmpty, "suffix shouldn't be empty")
    }
    
    func testTitle() {
        let title = Faker.Name.title()
        XCTAssertFalse(title.isEmpty, "title shouldn't be empty")
    }
}
