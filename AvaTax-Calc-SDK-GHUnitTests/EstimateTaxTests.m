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
        GHAssertTrue(response.Rate == 0.087, @"");
        GHAssertTrue(response.Tax == 0.87, @"");
        
        GHAssertTrue(response.TaxDetails.count == 2, @"");
        AvaTaxTaxDetail* stateTaxDetail = [response.TaxDetails objectAtIndex:0];
        GHAssertTrue([stateTaxDetail.Country isEqualToString:@"US"], @"");
        GHAssertTrue([stateTaxDetail.Region isEqualToString:@"WA"], @"");
        GHAssertTrue([stateTaxDetail.JurisType isEqualToString:@"State"], @"");
        GHAssertTrue(stateTaxDetail.Rate == 0.065, @"");
        GHAssertTrue(stateTaxDetail.Tax == 0.65, @"");
        GHAssertTrue([stateTaxDetail.JurisName isEqualToString:@"WASHINGTON"], @"");
        GHAssertTrue([stateTaxDetail.TaxName isEqualToString:@"WA STATE TAX"], @"");
        AvaTaxTaxDetail* cityTaxDetail = [response.TaxDetails objectAtIndex:1];
        GHAssertTrue([cityTaxDetail.Region isEqualToString:@"WA"], @"");
        GHAssertTrue([cityTaxDetail.JurisType isEqualToString:@"City"], @"");
        GHAssertTrue(cityTaxDetail.Rate == 0.022, @"");
        GHAssertTrue(cityTaxDetail.Tax == 0.22, @"");
        GHAssertTrue([cityTaxDetail.JurisName isEqualToString:@"BAINBRIDGE ISLAND"], @"");
        GHAssertTrue([cityTaxDetail.TaxName isEqualToString:@"WA CITY TAX"], @"");
    }];
}

- (void)test2 {
    [EstimateTaxTestRunner testEstimateTaxForSaleAmount:100 latitude:44.636001 longitude:-121.134425 testCase:self responseHandler:^(AvaTaxEstimateTaxResponse* response) {
        GHAssertTrue(response.ResultCode == ResultCode_Success, @"");
        GHAssertTrue(response.Rate == 0.0, @"");
        GHAssertTrue(response.Tax == 0.0, @"");
        
        GHAssertTrue(response.TaxDetails.count == 1, @"");
        AvaTaxTaxDetail* stateTaxDetail = [response.TaxDetails objectAtIndex:0];
        GHAssertTrue([stateTaxDetail.Country isEqualToString:@"US"], @"");
        GHAssertTrue([stateTaxDetail.Region isEqualToString:@"OR"], @"");
        GHAssertTrue([stateTaxDetail.JurisType isEqualToString:@"State"], @"");
        GHAssertTrue(stateTaxDetail.Rate == 0.0, @"");
        GHAssertTrue(stateTaxDetail.Tax == 0.0, @"");
        GHAssertTrue([stateTaxDetail.JurisName isEqualToString:@"OREGON"], @"");
        GHAssertTrue([stateTaxDetail.TaxName isEqualToString:@"OR STATE TAX"], @"");

    }];
}

- (void)test3 {
    [EstimateTaxTestRunner testEstimateTaxForSaleAmount:10 latitude:47.627935 longitude:122.51702 testCase:self responseHandler:^(AvaTaxEstimateTaxResponse* response) {
        GHAssertTrue(response.ResultCode == ResultCode_Error, @"");
        GHAssertTrue(response.Rate == 0.0, @"");
        GHAssertTrue(response.Tax == 0.0, @"");
        GHAssertTrue(response.TaxDetails.count == 0, @"");
        
        GHAssertTrue(response.Messages.count == 1, @"");
        AvaTaxResponseMessage* message = [response.Messages objectAtIndex:0];
        GHAssertTrue([message.RefersTo isEqualToString:@"Addresses[0]"], @"");
        GHAssertTrue(message.Severity == ResultCode_Error, @"");
        GHAssertTrue([message.Source isEqualToString:@"Avalara.AvaTax.Services.Tax"], @"");
        GHAssertTrue([message.Summary isEqualToString:@"Geocoding error Address is incomplete or invalid."], @"");
    }];
}

@end
