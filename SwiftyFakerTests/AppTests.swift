//
//  AppTests.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 10/4/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import XCTest
@testable import SwiftyFaker

class AppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testName() {
        let name = Faker.App.name()
        XCTAssertFalse(name.isEmpty, "name shouldn't be empty")
    }
    
    func testAppVersion() {
        let version = Faker.App.appVersion()
        XCTAssertFalse(version.isEmpty, "version shouldn't be empty")
    }
    
    func testAuthor() {
        let author = Faker.App.author()
        XCTAssertFalse(author.isEmpty, "author shouldn't be empty")
    }
}
