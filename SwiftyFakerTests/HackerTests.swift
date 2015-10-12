//
//  HackerTests.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 10/12/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import XCTest
@testable import SwiftyFaker

class HackerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSaySomethingSmart() {
        let somethingSmart = Faker.Hacker.saySomethingSmart()
        XCTAssertFalse(somethingSmart.isEmpty, "somethingSmart should not be empty")
    }
    
    func testAbbreviation() {
        let abbreviation = Faker.Hacker.abbreviation()
        XCTAssertFalse(abbreviation.isEmpty, "abbreviation should not be empty")
    }
    
    func testAdjective() {
        let adjective = Faker.Hacker.adjective()
        XCTAssertFalse(adjective.isEmpty, "adjective should not be empty")
    }
    
    func testNoun() {
        let noun = Faker.Hacker.noun()
        XCTAssertFalse(noun.isEmpty, "noun should not be empty")
    }
    
    func testVerb() {
        let verb = Faker.Hacker.verb()
        XCTAssertFalse(verb.isEmpty, "verb should not be empty")
    }
    
    func testIngverb() {
        let ingverb = Faker.Hacker.ingverb()
        XCTAssertFalse(ingverb.isEmpty, "ingverb should not be empty")
    }
}
