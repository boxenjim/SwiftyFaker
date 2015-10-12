//
//  SlackEmojiTests.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 10/12/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import XCTest
@testable import SwiftyFaker

class SlackEmojiTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPeople() {
        let people = Faker.SlackEmoji.people()
        XCTAssertFalse(people.isEmpty, "people should not be empty")
    }
    
    func testNature() {
        let nature = Faker.SlackEmoji.nature()
        XCTAssertFalse(nature.isEmpty, "nature should not be empty")
    }
    
    func testFoodAndDrink() {
        let fdDrnk = Faker.SlackEmoji.foodAndDrink()
        XCTAssertFalse(fdDrnk.isEmpty, "foodAndDrink should not be empty")
    }
    
    func testCelebration() {
        let celebration = Faker.SlackEmoji.celebration()
        XCTAssertFalse(celebration.isEmpty, "celebration should not be empty")
    }
    
    func testActivity() {
        let activity = Faker.SlackEmoji.activity()
        XCTAssertFalse(activity.isEmpty, "activity should not be empty")
    }
    
    func testTravelAndPlaces() {
        let trvlPlcs = Faker.SlackEmoji.travelAndPlaces()
        XCTAssertFalse(trvlPlcs.isEmpty, "travelAndPlaces should not be empty")
    }
    
    func testObjectsAndSymbols() {
        let objsSymbs = Faker.SlackEmoji.objectsAndSymbols()
        XCTAssertFalse(objsSymbs.isEmpty, "objectsAndSymbols should not be empty")
    }
    
    func testCustom() {
        let custom = Faker.SlackEmoji.custom()
        XCTAssertFalse(custom.isEmpty, "custom should not be empty")
    }
    
    func testEmoji() {
        let emoji = Faker.SlackEmoji.emoji()
        XCTAssertFalse(emoji.isEmpty, "emoji should not be empty")
    }
}
