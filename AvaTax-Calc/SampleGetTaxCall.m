//
//  SampleGetTaxCall.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 12/16/13.
//  Copyright (c) 2013 Avalara. All rights reserved.
//

#import "SampleGetTaxCall.h"
#import "AvaTaxCalc.h"
#import "AvaTaxGetTaxRequest.h"
#import "AvaTaxAddress.h"
#import "TestUserCredentials.h"

@implementation SampleGetTaxCall

- (AvaTaxGetTaxRequest*)samplePostJson {
    
    //NSString* json = @"{ 'DocDate': '2013-05-13', 'CustomerCode': 'CUST1', 'DetailLevel':'Document', 'Addresses':[ { 'AddressCode': '1', 'Line1': '100 Ravine Ln', 'Line2': '', 'City': 'Bainbridge Island', 'Region': 'WA', 'PostalCode': '98110' }], 'Lines':[ { 'LineNo': '1', 'DestinationCode': '1', 'OriginCode': '1', 'Qty': 1, 'Amount': 100 }] }";
    
    NSString* json = @"{ \"DocDate\": \"2013-05-13\", \"CustomerCode\": \"CUST1\", \"DetailLevel\":\"Document\", \"Addresses\":[ { \"AddressCode\": \"1\", \"Line1\": \"100 Ravine Ln\", \"Line2\": \"\", \"City\": \"Bainbridge Island\", \"Region\": \"WA\", \"PostalCode\": \"98110\" }], \"Lines\":[ { \"LineNo\": \"1\", \"DestinationCode\": \"1\", \"OriginCode\": \"1\", \"Qty\": 1, \"Amount\": 100 }] }";
    
    JSONModelError* error = nil;
    AvaTaxGetTaxRequest* jsonObject = [[AvaTaxGetTaxRequest alloc] initWithString:json error:&error];
    
    return jsonObject;
}

- (void)performGetTaxRequest {
    NSString* username = TEST_USERNAME;
    NSString* password = TEST_PASSWORD;
    
    AvaTaxCalc* avaTaxInterface = [[AvaTaxCalc alloc] initWithUser:username password:password development:YES];
    
    [avaTaxInterface getTax:[self samplePostJson] callback:self];
    
    
    AvaTaxAddress* address = [[AvaTaxAddress alloc] init];
    address.Line1 = @"645 W Nickerson St.";
    address.Line2 = @"Apt. 301";
    address.City = @"Seattle";
    address.State = @"WA";
    address.PostalCode = @"98119";
    [avaTaxInterface validateAddress:address callback:self];
    
    
}

- (void)getTaxFinished:(AvaTaxGetTaxResponse*)response {
    NSLog(@"getTaxFinished:\n%@\n\n", response);
}

- (void)validateAddressFinished:(AvaTaxValidateAddressResponse *)response {
    
}

- (void)cancelTaxFinished:(AvaTaxCancelTaxResponse*)response {
}

@end
