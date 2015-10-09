//
//  CommerceTests.swift
//  SwiftyFaker
//
//  Created by Jim Schultz on 10/8/15.
//  Copyright © 2015 Jim Schultz. All rights reserved.
//

import XCTest
@testable import SwiftyFaker

class CommerceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testColor() {
        let color = Faker.Commerce.color()
        XCTAssertFalse(color.isEmpty, "color should not be empty")
    }
    
    func testDepartment() {
        let dept = Faker.Commerce.department()
        XCTAssertFalse(dept.isEmpty, "department should not be empty")
    }
    
    func testProductName() {
        let name = Faker.Commerce.productName()
        XCTAssertFalse(name.isEmpty, "product name should not be empty")
    }
    
    func testMaterial() {
        let material = Faker.Commerce.material()
        XCTAssertFalse(material.isEmpty, "material should not be empty")
    }
    
    func testPrice() {
        let price = Faker.Commerce.price()
        XCTAssertTrue(price > 0 && price <= 100.0, "price: \(price) should be between 0 and 100.00")
    }
    
    func testProduct() {
        let product = Faker.Commerce.product()
        XCTAssertFalse(product.isEmpty, "product should not be empty")
    }
}
