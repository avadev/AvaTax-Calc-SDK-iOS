//
//  CancelTaxTests.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 2/27/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "CancelTaxTests.h"
#import "AvaTaxHeaders.h"
#import "TestUserCredentials.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface CancelTaxTestRunner : NSObject < AvaTaxCancelTaxDelegate >
{
    GHAsyncTestCase* _testCase;
    AvaTaxCancelTaxResponse* _reponse;
}

@property (nonatomic,retain) GHAsyncTestCase* testCase;
@property (nonatomic,retain) AvaTaxCancelTaxResponse* response;

+ (void)testCancelTax:(AvaTaxCancelTaxRequest*)cancelTaxRequest testCase:(GHAsyncTestCase*)testCase responseHandler:(void(^)(AvaTaxCancelTaxResponse*))responseHandler;
- (void)cancelTaxFinished:(AvaTaxCancelTaxResponse *)response;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation CancelTaxTestRunner

@synthesize testCase = _testCase;
@synthesize response = _response;

+ (void)testCancelTax:(AvaTaxCancelTaxRequest*)cancelTaxRequest testCase:(GHAsyncTestCase*)testCase responseHandler:(void(^)(AvaTaxCancelTaxResponse*))responseHandler {
    [testCase prepare]; // tell GHUnit to get ready for something asynchronous to happen
    
    CancelTaxTestRunner* runner = [[CancelTaxTestRunner alloc] init];
    runner.testCase = testCase;
    AvaTaxCalc* calc = [[AvaTaxCalc alloc] initWithUser:TEST_USERNAME password:TEST_PASSWORD development:YES];
    [calc cancelTax:cancelTaxRequest callback:runner];
    
    [testCase waitForStatus:kGHUnitWaitStatusSuccess timeout:4.0];
    
    responseHandler(runner.response);
}

- (void)cancelTaxFinished:(AvaTaxCancelTaxResponse *)response {
    self.response = response;
    [self.testCase notify:kGHUnitWaitStatusSuccess forSelector:NULL];
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation CancelTaxTests

- (void)test1 {
    AvaTaxCancelTaxRequest* cancelTaxRequest = [[AvaTaxCancelTaxRequest alloc] init];
    
}

@end
