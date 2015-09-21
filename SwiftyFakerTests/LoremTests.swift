//
//  LoremTests.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 9/21/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import XCTest
@testable import SwiftyFaker

class LoremTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testWord() {
        let word = Faker.Lorem.word()
        XCTAssertFalse(word.isEmpty, "word shouldn't be empty")
    }
    
    func testWords() {
        let words = Faker.Lorem.words()
        XCTAssertTrue(words.count == 3, "words default should have 3 words")
    }
    
    func testWordsWithCustomCount() {
        let count = Int.random(1...50)
        let words = Faker.Lorem.words(count)
        XCTAssertEqual(words.count, count, "words count should match, expected \(count) but got \(words.count)")
    }
    
    func testSentence() {
        let sentence = Faker.Lorem.sentence()
        let array = sentence.componentsSeparatedByString(" ")
        XCTAssertEqual(array.count, 4, "sentence default should have 4 words")
    }
    
    func testSentenceWithCustomCount() {
        let count = Int.random(1...50)
        let sentence = Faker.Lorem.sentence(count)
        let array = sentence.componentsSeparatedByString(" ")
        XCTAssertEqual(array.count, count, "sentence word count should match, expected \(count), but got \(array.count)")
    }
}
