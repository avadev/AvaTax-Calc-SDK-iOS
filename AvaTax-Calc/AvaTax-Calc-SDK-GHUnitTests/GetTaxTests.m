//
//  GetTaxTests.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 2/28/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "GetTaxTests.h"
#import "AvaTaxHeaders.h"
#import "TestUserCredentials.h"
#import "AvaTaxUtil.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface GetTaxTestRunner : NSObject < AvaTaxGetTaxDelegate >
{
    GHAsyncTestCase* _testCase;
    AvaTaxValidateAddressResponse* _reponse;
}

@property (nonatomic,retain) GHAsyncTestCase* testCase;
@property (nonatomic,retain) AvaTaxGetTaxResponse* response;

+ (void)testGetTax:(AvaTaxGetTaxRequest*)address testCase:(GHAsyncTestCase*)testCase responseHandler:(void(^)(AvaTaxGetTaxResponse*))responseHandler;
- (void)getTaxFinished:(AvaTaxGetTaxResponse *)response;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation GetTaxTestRunner

@synthesize testCase = _testCase;
@synthesize response = _response;

+ (void)testGetTax:(AvaTaxGetTaxRequest*)getTaxRequest testCase:(GHAsyncTestCase*)testCase responseHandler:(void(^)(AvaTaxGetTaxResponse*))responseHandler {
    [testCase prepare]; // tell GHUnit to get ready for something asynchronous to happen
    
    GetTaxTestRunner* runner = [[GetTaxTestRunner alloc] init];
    runner.testCase = testCase;
    AvaTaxCalc* calc = [[AvaTaxCalc alloc] initWithUser:TEST_USERNAME password:TEST_PASSWORD development:YES];
    [calc getTax:getTaxRequest callback:runner];
    
    [testCase waitForStatus:kGHUnitWaitStatusSuccess timeout:4.0];
    
    responseHandler(runner.response);
}

- (void)getTaxFinished:(AvaTaxGetTaxResponse *)response
{
    self.response = response;
    [self.testCase notify:kGHUnitWaitStatusSuccess forSelector:NULL];
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation GetTaxTests

- (void)test1 {
    AvaTaxGetTaxRequest* request = [[AvaTaxGetTaxRequest alloc] init];
    request.CustomerCode = @"CUST_99";
    request.DocDate = [AvaTaxUtil dateForYear:2013 month:12 day:16];
    request.CompanyCode = @"CZI";
    request.Commit = NO;
    request.DocCode = @"222";
    request.DocType = DocType_SalesInvoice;
    request.ReferenceCode = @"COZIMERCH";
    
    AvaTaxGetTaxAddress* address1 = [[AvaTaxGetTaxAddress alloc] init];
    address1.AddressCode = @"1";
    address1.Line1 = @"506 2nd Ave";
    address1.City = @"Seattle";
    address1.State = @"WA";
    address1.Country = @"US";
    address1.PostalCode = @"98104-2343";
    AvaTaxGetTaxAddress* address2 = [[AvaTaxGetTaxAddress alloc] init];
    address2.AddressCode = @"2";
    address2.Line1 = @"3308 19th Ave S";
    address2.City = @"Seattle";
    address2.State = @"WA";
    address2.Country = @"US";
    address2.PostalCode = @"98144-6420";
    request.Addresses = (NSArray<AvaTaxGetTaxAddress>*)[NSArray arrayWithObjects:address1, address2, nil];
    
    AvaTaxLine* line1001 = [[AvaTaxLine alloc] init];
    line1001.LineNo = @"1001";
    line1001.DestinationCode = @"2";
    line1001.OriginCode = @"1";
    line1001.ItemCode = @"CKBK-001";
    line1001.TaxCode = @"DWNLD";
    line1001.CustomerUsageType = CustomerUsageType_L_Other;
    line1001.Qty = 1;
    line1001.Amount = 5.00;
    line1001.Discounted = NO;
    line1001.TaxIncluded = NO;
    request.Lines = (NSArray<AvaTaxLine>*)[NSArray arrayWithObjects:line1001, nil];

    
    [GetTaxTestRunner testGetTax:request testCase:self responseHandler:^(AvaTaxGetTaxResponse* response){
        
        
    }];
}

@end
