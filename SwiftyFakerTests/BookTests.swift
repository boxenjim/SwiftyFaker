//
//  BookTests.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 10/5/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import XCTest
@testable import SwiftyFaker

class BookTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTitle() {
        let title = Faker.Book.title()
        XCTAssertFalse(title.isEmpty, "title should not be empty")
    }
    
    func testAuthor() {
        let author = Faker.Book.author()
        XCTAssertFalse(author.isEmpty, "author should not be empty")
    }
    
    func testPublisher() {
        let publisher = Faker.Book.publisher()
        XCTAssertFalse(publisher.isEmpty, "publisher should not be empty")
    }
}
