//
//  EstimateTaxTests.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 2/27/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "EstimateTaxTests.h"
#import "AvaTaxHeaders.h"
#import "TestUserCredentials.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface EstimateTaxTestRunner : NSObject < AvaTaxEstimateTaxDelegate >
{
    GHAsyncTestCase* _testCase;
    AvaTaxEstimateTaxResponse* _reponse;
}

@property (nonatomic,retain) GHAsyncTestCase* testCase;
@property (nonatomic,retain) AvaTaxEstimateTaxResponse* response;

+ (void)testEstimateTaxForSaleAmount:(double)saleAmount latitude:(double)latitude longitude:(double)longitude testCase:(GHAsyncTestCase*)testCase responseHandler:(void(^)(AvaTaxEstimateTaxResponse*))responseHandler;
- (void)estimateTaxFinished:(AvaTaxEstimateTaxResponse *)response;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation EstimateTaxTestRunner

@synthesize testCase = _testCase;
@synthesize response = _response;

+ (void)testEstimateTaxForSaleAmount:(double)saleAmount latitude:(double)latitude longitude:(double)longitude testCase:(GHAsyncTestCase*)testCase responseHandler:(void(^)(AvaTaxEstimateTaxResponse*))responseHandler {
    [testCase prepare]; // tell GHUnit to get ready for something asynchronous to happen
    
    EstimateTaxTestRunner* runner = [[EstimateTaxTestRunner alloc] init];
    runner.testCase = testCase;
    AvaTaxCalc* calc = [[AvaTaxCalc alloc] initWithUser:TEST_USERNAME password:TEST_PASSWORD development:YES];
    [calc estimateTaxForSaleAmount:saleAmount latitude:latitude longitude:longitude callback:runner];
    
    [testCase waitForStatus:kGHUnitWaitStatusSuccess timeout:4.0];
    
    responseHandler(runner.response);
}

- (void)estimateTaxFinished:(AvaTaxEstimateTaxResponse *)response {
    self.response = response;
    [self.testCase notify:kGHUnitWaitStatusSuccess forSelector:NULL];
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation EstimateTaxTests

- (void)test1 {
    [EstimateTaxTestRunner testEstimateTaxForSaleAmount:10 latitude:47.627935 longitude:-122.51702 testCase:self responseHandler:^(AvaTaxEstimateTaxResponse* response) {
        GHAssertTrue(response.ResultCode == ResultCode_Success, @"");
        GHAssertTrue(response.TaxDetails.count == 1, @"");
        AvaTaxTaxDetail* taxDetail = [response.TaxDetails objectAtIndex:0];
        GHAssertTrue(taxDetail.Rate == 0.065, @"");
    }];
}

@end
