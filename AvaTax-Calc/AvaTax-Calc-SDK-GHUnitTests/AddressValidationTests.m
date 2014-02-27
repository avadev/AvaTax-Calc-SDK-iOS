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
#import "AvaTaxValidatedAddress.h"
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

- (void)test1 {
    AvaTaxAddress* address = [[AvaTaxAddress alloc] init];
    address.Line1 = @"506 2nd Ave";
    address.Line2 = @"Ste 800";
    address.City = @"Seattle";
    address.Region = @"WI";
    address.PostalCode = @"98144-2328";
    
    [AddressValidationTestRunner testAddressValidationFor:address testCase:self responseHandler:^(AvaTaxValidateAddressResponse* response){
        GHAssertTrue([response.ResultCode isEqualToString:@"Success"], @"");
        GHAssertTrue([response.Address.Line1Line2Line3 isEqualToString:@"506 2nd Ave Ste 800"], @"");
        GHAssertTrue([response.Address.Region isEqualToString:@"WA"], @"");
        GHAssertTrue(response.Address.AddressType == AddressType_H, @"");
        GHAssertTrue([response.Address.CarrierRoute isEqualToString:@"C042"], @"");
        GHAssertTrue([response.Address.PostNet isEqualToString:@"981042328003"], @"");
        GHAssertTrue([response.Address.FipsCode isEqualToString:@"5303300000"], @"");
    }];
}

- (void)test2 {
    AvaTaxAddress* address = [[AvaTaxAddress alloc] init];
    address.Line1 = @"435 Erickson Ave NE";
    address.Line2 = @"";
    address.City = @"Bainbridge Island";
    address.Region = @"WA";
    address.PostalCode = @"98110";
    
    [AddressValidationTestRunner testAddressValidationFor:address testCase:self responseHandler:^(AvaTaxValidateAddressResponse* response){
        GHAssertTrue([response.ResultCode isEqualToString:@"Success"], @"");
        GHAssertTrue([response.Address.Line1Line2Line3 isEqualToString:@"435 Ericksen Ave NE"], @"");
        GHAssertTrue([response.Address.City isEqualToString:@"Bainbridge Island"], @"");
        GHAssertTrue([response.Address.Region isEqualToString:@"WA"], @"");
        GHAssertTrue(response.Address.AddressType == AddressType_H, @"");
        GHAssertTrue([response.Address.CarrierRoute isEqualToString:@"C051"], @"");
        GHAssertTrue([response.Address.PostNet isEqualToString:@"981101896999"], @"");
        GHAssertTrue([response.Address.FipsCode isEqualToString:@"5303500000"], @"");
    }];
}

- (void)test3 {
    AvaTaxAddress* address = [[AvaTaxAddress alloc] init];
    address.Line1 = @"Unit 2050";
    address.Line2 = @"Box 4190";
    address.City = @"APO";
    address.Region = @"AP";
    address.PostalCode = @"96278-2050";
    
    [AddressValidationTestRunner testAddressValidationFor:address testCase:self responseHandler:^(AvaTaxValidateAddressResponse* response){
        GHAssertTrue([response.ResultCode isEqualToString:@"Success"], @"");
        GHAssertTrue([response.Address.Line3 isEqualToString:@"Unit 2050 Box 4190"], @"");
        GHAssertTrue([response.Address.City isEqualToString:@"APO"], @"");
        GHAssertTrue([response.Address.Region isEqualToString:@"AP"], @"");
        GHAssertTrue([response.Address.Country isEqualToString:@"US"], @"");
        GHAssertTrue([response.Address.PostalCode isEqualToString:@"96278-2050"], @"");
        GHAssertTrue(response.Address.AddressType == AddressType_S, @"");
        GHAssertTrue([response.Address.CarrierRoute isEqualToString:@"C000"], @"");
        GHAssertTrue([response.Address.PostNet isEqualToString:@"962782050902"], @"");
        GHAssertTrue([response.Address.FipsCode isEqualToString:@"0000000000"], @"");
    }];
}




@end
