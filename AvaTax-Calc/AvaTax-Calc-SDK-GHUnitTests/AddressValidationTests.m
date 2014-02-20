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
    void (^_responseHandler)(AvaTaxValidateAddressResponse*);
}

@property (nonatomic,copy) void(^responseHandler)(AvaTaxValidateAddressResponse*);

+ (void)testAddressValidationFor:(AvaTaxAddress*)address responseHandler:(void(^)(AvaTaxValidateAddressResponse*))responseHandler;
- (void)validateAddressFinished:(AvaTaxValidateAddressResponse*)response;

@end

@implementation AddressValidationTestRunner

+ (void)testAddressValidationFor:(AvaTaxAddress*)address responseHandler:(void(^)(AvaTaxValidateAddressResponse*))responseHandler {
    AddressValidationTestRunner* runner = [[AddressValidationTestRunner alloc] init];
    runner.responseHandler = responseHandler;
    AvaTaxCalc* calc = [[AvaTaxCalc alloc] initWithUser:TEST_USERNAME password:TEST_PASSWORD development:YES];
    [calc validateAddress:address callback:runner];
}

- (void)validateAddressFinished:(AvaTaxValidateAddressResponse*)response {
    _responseHandler(response);
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
    
    [AddressValidationTestRunner testAddressValidationFor:address responseHandler:^(AvaTaxValidateAddressResponse* response){
        GHAssertTrue([response.ResultCode isEqualToString:@"201"], @"Result code 200");
    }];
}

@end
