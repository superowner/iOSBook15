//
//  PITaxUITests.m
//  PITaxUITests
//
//  Created by tonyguan on 2016/11/5.
//  Copyright © 2016年 tony. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface PITaxUITests : XCTestCase

@end

@implementation PITaxUITests

- (void)setUp {
    [super setUp];
    // 测试用例出错后是否继续执行，设置为ture是继续执行，设置为false是终止。
    self.continueAfterFailure = NO;
    // UI测试必须启动应用，该语句可以启动应用程序
    [[[XCUIApplication alloc] init] launch];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testExample {
    
    /////////////录制生成脚本 开始///////////////////
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *textfieldRevenueTextField = app.textFields[@"TextField Revenue"];
    [textfieldRevenueTextField tap];
    [textfieldRevenueTextField typeText:@"5000"];
    
    [app.buttons[@"Calculate Button"] tap];
    /////////////录制生成脚本 结束//////////////////

    //自己添加的代码
    XCUIElement* lbl = app.staticTexts[@"45.00"];
    XCTAssert(lbl.exists);
    
}

@end
