//
//  AddressValidationTests.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 2/19/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "AddressValidationTests.h"
#import "AvaTaxAddress.h"
#import "AvaTaxValidateAddressResponse.h"
#import "AvaTaxCalc.h"
#import "TestUserCredentials.h"

@interface AddressValidationTestRunner : NSObject < AvaTaxValidateAddressDelegate >
{
    GHAsyncTestCase* _testCase;
//    void (^_responseHandler)(AvaTaxValidateAddressResponse*);
    AvaTaxValidateAddressResponse* _reponse;
}

@property (nonatomic,retain) GHAsyncTestCase* testCase;
//@property (nonatomic,copy) void(^responseHandler)(AvaTaxValidateAddressResponse*);
@property (nonatomic,retain) AvaTaxValidateAddressResponse* response;

+ (void)testAddressValidationFor:(AvaTaxAddress*)address testCase:(GHAsyncTestCase*)testCase responseHandler:(void(^)(AvaTaxValidateAddressResponse*))responseHandler;
- (void)validateAddressFinished:(AvaTaxValidateAddressResponse*)response;

@end

@implementation AddressValidationTestRunner

//@synthesize responseHandler = _reponseHandler;
@synthesize testCase = _testCase;
@synthesize response = _response;

+ (void)testAddressValidationFor:(AvaTaxAddress*)address testCase:(GHAsyncTestCase*)testCase responseHandler:(void(^)(AvaTaxValidateAddressResponse*))responseHandler {
    [testCase prepare]; // tell GHUnit to get ready for something asynchronous to happen
    
    AddressValidationTestRunner* runner = [[AddressValidationTestRunner alloc] init];
    runner.testCase = testCase;
//    runner.responseHandler = responseHandler;
    AvaTaxCalc* calc = [[AvaTaxCalc alloc] initWithUser:TEST_USERNAME password:TEST_PASSWORD development:YES];
    [calc validateAddress:address callback:runner];
    
    [testCase waitForStatus:kGHUnitWaitStatusSuccess timeout:4.0];
    
    responseHandler(runner.response);
}

- (void)validateAddressFinished:(AvaTaxValidateAddressResponse*)response {
    self.response = response;
    [self.testCase notify:kGHUnitWaitStatusSuccess forSelector:NULL];
}

@end

@implementation AddressValidationTests

- (void)testSmithTowerRegionTypo {
    AvaTaxAddress* address = [[AvaTaxAddress alloc] init];
    address.Line1 = @"506 2nd Ave";
    address.Line2 = @"Ste 800";
    address.City = @"Seattle";
    address.Region = @"WI";
    address.PostalCode = @"98144-2328";
    
    [AddressValidationTestRunner testAddressValidationFor:address testCase:self responseHandler:^(AvaTaxValidateAddressResponse* response){
        GHAssertTrue([response.ResultCode isEqualToString:@"Success"], @"Result code 200");
    }];
}



@end
