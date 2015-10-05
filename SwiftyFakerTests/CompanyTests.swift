//
//  CompanyTests.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 10/4/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import XCTest
@testable import SwiftyFaker

class CompanyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testName() {
        let name = Faker.Company.name()
        XCTAssertFalse(name.isEmpty, "name shouldn't be empty")
    }
 
    func testSuffix() {
        let suffix = Faker.Company.suffix()
        XCTAssertFalse(suffix.isEmpty, "suffix shouldn't be empty")
    }
    
    func testCatchPhrase() {
        let phrase = Faker.Company.catchPhrase()
        XCTAssertFalse(phrase.isEmpty, "catchPhrase shouldn't be empty")
    }
    
    func testBuzzword() {
        let buzzword = Faker.Company.buzzword()
        XCTAssertFalse(buzzword.isEmpty, "buzzword shouldn't be empty")
    }
    
    func testBs() {
        let bs = Faker.Company.bs()
        XCTAssertFalse(bs.isEmpty, "bs shouldn't be empty")
    }
    
    func testEin() {
        let ein = Faker.Company.ein()
        XCTAssertFalse(ein.isEmpty, "ein shouldn't be empty")
    }
    
    func testDunsNumber() {
        let dunsNumber = Faker.Company.dunsNumber()
        XCTAssertFalse(dunsNumber.isEmpty, "dunsNumber shouldn't be empty")
    }
    
    func testLogo() {
        let logo = Faker.Company.logo()
        XCTAssertFalse(logo.isEmpty, "logo shouldn't be empty")
    }
    
    func testSwedishOrganisationNumber() {
        let num = Faker.Company.swedishOrganisationNumber()
        XCTAssertFalse(num.isEmpty, "swedishOrganisationNumber shouldn't be empty")
    }
}
