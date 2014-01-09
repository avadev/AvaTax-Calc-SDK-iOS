//
//  SampleGetTaxCall.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 12/16/13.
//  Copyright (c) 2013 Avalara. All rights reserved.
//

#import "SampleGetTaxCall.h"
#import "AvaTaxCalc.h"
#import "GetTaxRequestBody.h"

@implementation SampleGetTaxCall

- (GetTaxRequestBody*)samplePostJson {
    
    //NSString* json = @"{ 'DocDate': '2013-05-13', 'CustomerCode': 'CUST1', 'DetailLevel':'Document', 'Addresses':[ { 'AddressCode': '1', 'Line1': '100 Ravine Ln', 'Line2': '', 'City': 'Bainbridge Island', 'Region': 'WA', 'PostalCode': '98110' }], 'Lines':[ { 'LineNo': '1', 'DestinationCode': '1', 'OriginCode': '1', 'Qty': 1, 'Amount': 100 }] }";
    
    NSString* json = @"{ \"DocDate\": \"2013-05-13\", \"CustomerCode\": \"CUST1\", \"DetailLevel\":\"Document\", \"Addresses\":[ { \"AddressCode\": \"1\", \"Line1\": \"100 Ravine Ln\", \"Line2\": \"\", \"City\": \"Bainbridge Island\", \"Region\": \"WA\", \"PostalCode\": \"98110\" }], \"Lines\":[ { \"LineNo\": \"1\", \"DestinationCode\": \"1\", \"OriginCode\": \"1\", \"Qty\": 1, \"Amount\": 100 }] }";
    
    JSONModelError* error = nil;
    GetTaxRequestBody* jsonObject = [[GetTaxRequestBody alloc] initWithString:json error:&error];
    
    return jsonObject;
}

- (void)performGetTaxRequest {
    NSString* username = @"rob.busack";
    NSString* password = @"";
    
    AvaTaxCalc* avaTaxInterface = [[AvaTaxCalc alloc] initWithDelegate:self user:username password:password];
    
    [avaTaxInterface getTax:[self samplePostJson]];
}

- (void)getTaxFinished:(GetTaxResponseBody*)response {
    
}

@end
