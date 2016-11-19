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

}

@end
