
//
//  AddressTests.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/21/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import XCTest
@testable import SwiftyFaker

class AddressTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCity() {
        let city = Faker.Address.city()
        XCTAssertFalse(city.isEmpty, "city shouldn't be empty")
    }
    
    func testStreetName() {
        let streetName = Faker.Address.streetName()
        XCTAssertFalse(streetName.isEmpty, "streetName shouldn't be empty")
    }
    
    func testStreetAddress() {
        let streetAddress = Faker.Address.streetAddress()
        XCTAssertFalse(streetAddress.isEmpty, "streetAddress shouldn't be empty")
    }
    
    func testSecondaryAddress() {
        let secondaryAddress = Faker.Address.secondaryAddress()
        XCTAssertFalse(secondaryAddress.isEmpty, "secondaryAddress shouldn't be empty")
    }
    
    func testBuildingNumber() {
        let buildingNumber = Faker.Address.buildingNumber()
        XCTAssertFalse(buildingNumber.isEmpty, "buildingNumber shouldn't be empty")
    }
    
    func testTimezone() {
        let timezone = Faker.Address.timezone()
        XCTAssertFalse(timezone.isEmpty, "timezone shouldn't be empty")
    }
    
    func testLatitude() {
        let lat = Faker.Address.latitude()
        XCTAssertTrue(Double(lat) >= -180.0 && Double(lat) <= 180.0, "\(lat) should be between -180.0 and 180.0")
    }
    
    func testLongitude() {
        let lon = Faker.Address.longitude()
        XCTAssertTrue(Double(lon) >= 0.0 && Double(lon) <= 90.0, "\(lon) should be between 0.0 and 90.0")
    }

}
