//
//  BusinessTests.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 10/5/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import XCTest
@testable import SwiftyFaker

class BusinessTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreditCardNumber() {
        let number = Faker.Business.creditCardNumber()
        XCTAssertFalse(number.isEmpty, "creditCardNumber should not be empty")
    }
    
    func testCreditCardExpiry() {
        let expiry = Faker.Business.creditCardExpiry()
        let result = expiry.compare(NSDate())
        XCTAssertTrue(result == NSComparisonResult.OrderedDescending)
    }
    
    func testCreditCardType() {
        let type = Faker.Business.creditCardType()
        XCTAssertFalse(type.isEmpty, "creditCardType should not be empty")
    }
}
