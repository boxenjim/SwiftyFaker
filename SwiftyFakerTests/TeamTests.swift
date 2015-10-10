//
//  TeamTests.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 10/10/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import XCTest
@testable import SwiftyFaker

class TeamTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreature() {
        let creature = Faker.Team.creature()
        XCTAssertFalse(creature.isEmpty, "creature should not be empty")
    }
    
    func testName() {
        let name = Faker.Team.name()
        XCTAssertFalse(name.isEmpty, "name should not be empty")
    }
    
    func testSport() {
        let sport = Faker.Team.sport()
        XCTAssertFalse(sport.isEmpty, "sport should not be empty")
    }
    
    func testState() {
        let state = Faker.Team.state()
        XCTAssertFalse(state.isEmpty, "state should not be empty")
    }
}
