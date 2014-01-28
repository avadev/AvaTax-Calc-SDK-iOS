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
#import "GetTaxRequestBody.h"
#import "GetTaxResponseBody.h"
#import "AvaTaxAddress.h"
#import "AvaTaxValidateAddressResponse.h"
#import "CancelTaxRequestBody.h"
#import "AvaTaxCancelTaxResponse.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxCalc ()

@property (readonly) NSString* encodedLoginData;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvaTaxCalc

@synthesize username = _username;
@synthesize encodedLoginData = _encodedLoginData;

- (id)initWithUser:(NSString*)username password:(NSString *)password {
    self = [super init];
    if (self) {
        [self setUsername:username password:password];
    }
    return self;
}

- (void)setUsername:(NSString*)username password:(NSString*)password {
    _username = username;
    
    NSString* loginString = [NSString stringWithFormat:@"%@:%@", username, password];
    _encodedLoginData = [RBTBase64 encode:[loginString dataUsingEncoding:NSUTF8StringEncoding]];
}

- (void)getTax:(GetTaxRequestBody*)postBody callback:(NSObject<AvaTaxGetTaxDelegate>*)callback {
    NSString* url = @"https://development.avalara.net/1.0/tax/get/";
    
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
    NSString *url = [NSString stringWithFormat:@"https://development.avalara.net/1.0/address/validate?Line1=%@&Line2=%@&Line3=%@&City=%@&Region=%@&PostalCode=%@",address.Line1, address.Line2, address.Line3, address.City,address.Region,address.PostalCode];
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
    // development
    NSString* url = @"https://development.avalara.net/1.0/tax/cancel";
    
    // production
    //NSString* url = @"https://avatax.avalara.net/1.0/tax/cancel";
    
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



@end
