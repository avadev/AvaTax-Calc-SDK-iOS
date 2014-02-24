//
//  AvaTaxCalc.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 12/18/13.
//  Copyright (c) 2013 Avalara. All rights reserved.
//

#import "AvaTaxCalc.h"
#import "RBTBase64.h"
#import "AvaTaxWebCall.h"
#import "AvaTaxGetTaxRequest.h"
#import "GetTaxResponseBody.h"
#import "AvaTaxAddress.h"
#import "AvaTaxValidateAddressResponse.h"
#import "CancelTaxRequestBody.h"
#import "AvaTaxCancelTaxResponse.h"
#import "TaxSummaryRequestBody.h"
#import "TaxSummaryResponse.h"
#import "AvaTaxEstimateTaxResponse.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxCalc ()

@property (readonly) NSString* encodedLoginData;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvaTaxCalc

@synthesize username = _username;
@synthesize encodedLoginData = _encodedLoginData;

- (id)initWithUser:(NSString*)username password:(NSString *)password development:(BOOL)devServersNotProd {
    self = [super init];
    if (self) {
        [self setUsername:username password:password];
        _useDevServer = devServersNotProd;
    }
    return self;
}

- (void)setUsername:(NSString*)username password:(NSString*)password {
    _username = username;
    
    NSString* loginString = [NSString stringWithFormat:@"%@:%@", username, password];
    _encodedLoginData = [RBTBase64 encode:[loginString dataUsingEncoding:NSUTF8StringEncoding]];
}

- (NSString*)hostName {
    if (_useDevServer) {
        return @"development.avalara.net";
    } else {
        return @"avatax.avalara.net";
    }
}

- (void)getTax:(AvaTaxGetTaxRequest*)postBody callback:(NSObject<AvaTaxGetTaxDelegate>*)callback {
    NSString* url = [NSString stringWithFormat:@"https://%@/1.0/tax/get/", [self hostName]];
    
    AvaTaxWebCall* webCall = [[AvaTaxWebCall alloc] initWithUrl:url callbackTarget:self selector:@selector(getTaxFinished:)];
    webCall.userObject = callback;
    [webCall addAuthFrom:self];
    [webCall post:[postBody toJSONString]];
}

- (void)getTaxFinished:(AvaTaxWebCall*)webCall {
    JSONModelError* error = nil;
    
    NSString* responseAsString = [webCall responseAsString];
    GetTaxResponseBody* response = [[GetTaxResponseBody alloc] initWithString:responseAsString error:&error];
    NSObject<AvaTaxGetTaxDelegate>* callback = webCall.userObject;
    [callback getTaxFinished:response];
}

- (void)validateAddress:(AvaTaxAddress*)address callback:(NSObject<AvaTaxValidateAddressDelegate>*)callback {
    NSString *url = [NSString stringWithFormat:@"https://%@/1.0/address/validate?Line1=%@&Line2=%@&Line3=%@&City=%@&Region=%@&PostalCode=%@", [self hostName], address.Line1, address.Line2, address.Line3, address.City,address.Region,address.PostalCode];
    url = [url stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    AvaTaxWebCall* webCall = [[AvaTaxWebCall alloc] initWithUrl:url callbackTarget:self selector:@selector(validateAddressFinished:)];
    webCall.userObject = callback;
    [webCall addAuthFrom:self];
    [webCall get];
    
}

- (void)validateAddressFinished:(AvaTaxWebCall*)webCall {
    JSONModelError* error = nil;
    
    NSString* responseAsString = [webCall responseAsString];
    AvaTaxValidateAddressResponse* response = [[AvaTaxValidateAddressResponse alloc] initWithString:responseAsString error:&error];
    NSObject<AvaTaxValidateAddressDelegate>* callback = webCall.userObject;
    [callback validateAddressFinished:response];
}

- (void)cancelTax:(CancelTaxRequestBody*)cancelBody callback:(NSObject<AvaTaxCancelTaxDelegate>*)callback {
    NSString* url = [NSString stringWithFormat:@"https://%@/1.0/tax/cancel", [self hostName]];
    
    AvaTaxWebCall* webCall = [[AvaTaxWebCall alloc] initWithUrl:url callbackTarget:self selector:@selector(cancelTaxFinished:)];
    webCall.userObject = callback;
    [webCall addAuthFrom:self];
    [webCall post:[cancelBody toJSONString]];
}

- (void)cancelTaxFinished:(AvaTaxWebCall*)webCall {
    JSONModelError* error = nil;
    
    NSString* responseAsString = [webCall responseAsString];
    AvaTaxCancelTaxResponse* response = [[AvaTaxCancelTaxResponse alloc] initWithString:responseAsString error:&error];
    NSObject<AvaTaxCancelTaxDelegate>* callback = webCall.userObject;
    [callback cancelTaxFinished:response];
}

- (void)getTaxSummary:(TaxSummaryRequestBody*)taxSummaryRequest callback:(NSObject<AvaTaxTaxSummaryDelegate>*)callback {
    
    NSString* url = [NSString stringWithFormat:@"https://%@/1.0/tax/taxsummary", [self hostName]];
    
    AvaTaxWebCall* webCall = [[AvaTaxWebCall alloc] initWithUrl:url callbackTarget:self selector:@selector(getTaxSummaryFinished:)];
    webCall.userObject = callback;
    [webCall addAuthFrom:self];
    [webCall post:[taxSummaryRequest toJSONString]];
}

- (void)getTaxSummaryFinished:(AvaTaxWebCall*)webCall {
    JSONModelError* error = nil;
    NSString* responseAsString = [webCall responseAsString];
    TaxSummaryResponse* response = [[TaxSummaryResponse alloc] initWithString:responseAsString error:&error];
    NSObject<AvaTaxTaxSummaryDelegate>* callback = webCall.userObject;
    [callback getTaxSummaryFinished:response];
}

- (void)estimateTaxForSaleAmount:(double)saleAmount latitude:(double)latitude longitude:(double)longitude callback:(NSObject<AvaTaxEstimateTaxDelegate>*)callback {
    NSString* url = [NSString stringWithFormat:@"https://%@/1.0/tax/%f,%f/get?%f", [self hostName], latitude, longitude, saleAmount];
    
    AvaTaxWebCall* webCall = [[AvaTaxWebCall alloc] initWithUrl:url callbackTarget:self selector:@selector(estimateTaxDidFinish:)];
    webCall.userObject = callback;
    [webCall addAuthFrom:self];
    [webCall get];
}

- (void)estimateTaxFinished:(AvaTaxWebCall*)webCall {
    JSONModelError* error = nil;
    NSString* responseAsString = [webCall responseAsString];
    AvaTaxEstimateTaxResponse* response = [[AvaTaxEstimateTaxResponse alloc] initWithString:responseAsString error:&error];
    NSObject<AvaTaxEstimateTaxDelegate>* callback = webCall.userObject;
    [callback estimateTaxFinished:response];
}

@end
