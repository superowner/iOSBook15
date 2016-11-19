//
//  SimpleTableUITests.swift
//  SimpleTableUITests
//
//  Created by tonyguan on 2016/11/5.
//  Copyright © 2016年 tony. All rights reserved.
//

import XCTest

class SimpleTableUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()

        print("========================")
        print(XCUIApplication().debugDescription)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
