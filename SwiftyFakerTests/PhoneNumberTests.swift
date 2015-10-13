//
//  PhoneNumberTests.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 10/12/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import XCTest
@testable import SwiftyFaker

class PhoneNumberTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPhoneNumber() {
        let number = Faker.PhoneNumber.phoneNumber()
        XCTAssertFalse(number.isEmpty, "phoneNumber should not be empty")
    }
    
    func testCellPhone() {
        let number = Faker.PhoneNumber.cellPhone()
        XCTAssertFalse(number.isEmpty, "cellPhone should not be empty")
    }
    
    func testAreaCode() {
        let code = Faker.PhoneNumber.areaCode()
        XCTAssertFalse(code.isEmpty, "areaCode should not be empty")
    }
    
    func testExchangeCode() {
        let code = Faker.PhoneNumber.exchangeCode()
        XCTAssertFalse(code.isEmpty, "exchangeCode should not be empty")
    }
    
    func testSubscriberNumber() {
        let number = Faker.PhoneNumber.subscriberNumber()
        XCTAssertFalse(number.isEmpty, "subscriberNumber should not be empty")
    }
    
    func testExtensionNumber() {
        let number = Faker.PhoneNumber.extensionNumber()
        XCTAssertFalse(number.isEmpty, "extensionNumber should not be empty")
    }
    
    func testExtensionNumberLengthMatch() {
        let length = Int.random(1...9)
        let number = Faker.PhoneNumber.extensionNumber(length)
        XCTAssertEqual(length, number.characters.count, "extensionNumber char count should match length \(length)")
    }
}
