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
        XCTAssertFalse(name.isEmpty, "\(name)")
    }
    
    func testFirstName() {
        let firstName = Faker.Name.name()
        XCTAssertFalse(firstName.isEmpty, "\(firstName)")
    }
    
    func testLastName() {
        let lastName = Faker.Name.name()
        XCTAssertFalse(lastName.isEmpty, "\(lastName)")
    }
    
    func testPrefix() {
        let prefix = Faker.Name.prefix()
        XCTAssertFalse(prefix.isEmpty, "\(prefix)")
    }
    
    func testSuffix() {
        let suffix = Faker.Name.suffix()
        XCTAssertFalse(suffix.isEmpty, "\(suffix)")
    }
    
    func testTitle() {
        let title = Faker.Name.title()
        XCTAssertFalse(title.isEmpty, "\(title)")
    }
}
