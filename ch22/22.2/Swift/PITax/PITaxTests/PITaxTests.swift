//
//  PITaxTests.swift
//  PITaxTests
//
//  Created by tonyguan on 2016/11/5.
//  Copyright © 2016年 tony. All rights reserved.
//

import XCTest
import PITax

class PITaxTests: XCTestCase {
    
    var bl: TaxRevenueBL!
    
    override func setUp() {
        super.setUp()
        self.bl = TaxRevenueBL()
    }
    
    override func tearDown() {
        self.bl = nil
        super.tearDown()
    }
    
    //测试月应纳税额不超过1500元 用例1
    func testCalculateLevel1() {
        let dbRevenue = 5000.0
        let tax = self.bl.calculate(dbRevenue)
        XCTAssertEqual(tax, 45.0, "用例1测试失败")
    }
    
    //测试月应纳税额超过1500元至4500元 用例2
    func testCalculateLevel2() {
        let dbRevenue = 8000.0
        let tax = self.bl.calculate(dbRevenue)
        XCTAssertEqual(tax, 345.0, "用例2测试失败")
    }
    
    //测试月应纳税额超过4500元至9000元 用例3
    func testCalculateLevel3() {
        let dbRevenue = 12500.0
        let tax = self.bl.calculate(dbRevenue)
        XCTAssertEqual(tax, 1245.0, "用例3测试失败")
    }
    
    //测试月应纳税额超过9000元至35000元 用例4
    func testCalculateLevel4() {
        let dbRevenue = 38500.0
        let tax = self.bl.calculate(dbRevenue)
        XCTAssertEqual(tax, 7745.0, "用例4测试失败")
    }
    
    //测试月应纳税额超过35000元至55000元 用例5
    func testCalculateLevel5() {
        let dbRevenue = 58500.0
        let tax = self.bl.calculate(dbRevenue)
        XCTAssertEqual(tax, 13745.0, "用例5测试失败")
    }
    
    //测试月应纳税额超过55000元至80000元 用例6
    func testCalculateLevel6() {
        let dbRevenue = 83500.0
        let tax = self.bl.calculate(dbRevenue)
        XCTAssertEqual(tax, 22495.0, "用例6测试失败")
    }
    
    //测试月应纳税额超过80000元 用例7
    func testCalculateLevel7() {
        let dbRevenue = 103500.0
        let tax = self.bl.calculate(dbRevenue)
        XCTAssertEqual(tax, 31495.0, "用例7测试失败")
    }
    
}
