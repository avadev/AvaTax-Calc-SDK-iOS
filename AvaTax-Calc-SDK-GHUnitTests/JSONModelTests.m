//
//  JSONModelTests.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/3/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "JSONModelTests.h"
#import "JSONModel.h"
#import "AvaTaxGetTaxRequest.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation JSONModelTests

- (void)testJsonModeling {
    
    NSString* originalJson = @"{ \"DocDate\": \"2013-05-13\", \"CustomerCode\": \"CUST1\", \"DetailLevel\":\"Document\", \"Addresses\":[ { \"AddressCode\": \"1\", \"Line1\": \"100 Ravine Ln\", \"Line2\": \"\", \"City\": \"Bainbridge Island\", \"Region\": \"WA\", \"PostalCode\": \"98110\" }], \"Lines\":[ { \"LineNo\": \"1\", \"DestinationCode\": \"1\", \"OriginCode\": \"1\", \"Qty\": 1, \"Amount\": 100 }] }";
    
    JSONModelError* error = nil;
    AvaTaxGetTaxRequest* jsonObject = [[AvaTaxGetTaxRequest alloc] initWithString:originalJson error:&error];
    
    GHAssertNil(error, @"");
    NSString* outputJson = [jsonObject toJSONString];
    
    GHAssertTrue(outputJson.length > 0, @"");
}

@end
