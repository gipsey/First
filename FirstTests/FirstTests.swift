//
//  FirstTests.swift
//  FirstTests
//
//  Created by David Debre on 12/4/17.
//  Copyright © 2017 David Debre. All rights reserved.
//

import XCTest
@testable import First

class FirstTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_whenDataIsInvalid_initializationFails() {
        let meal1 = Meal("", nil, 1)
        XCTAssertNil(meal1)
        
        let meal2 = Meal("nonempty", nil, -1)
        XCTAssertNil(meal2)
        
        let meal3 = Meal("nonempty", nil, 6)
        XCTAssertNil(meal3)
    }
    
    func test_whenDataIsValid_initializationSuceeds() {
        let meal1 = Meal("something", nil, 1)
        XCTAssertNotNil(meal1)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
