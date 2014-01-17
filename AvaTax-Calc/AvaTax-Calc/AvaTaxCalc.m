//
//  AvaTaxCalc.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 12/18/13.
//  Copyright (c) 2013 Avalara. All rights reserved.
//

#import "AvaTaxCalc.h"
#import "RBTBase64.h"
#import "ATWebCall.h"
#import "GetTaxRequestBody.h"
#import "GetTaxResponseBody.h"
#import "AvaTaxAddress.h"
#import "AvaTaxValidateAddressResponse.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxCalc ()

@property (readonly) NSString* encodedLoginData;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvaTaxCalc

@synthesize username = _username;
@synthesize encodedLoginData = _encodedLoginData;

- (id)initWithDelegate:(NSObject<AvaTaxDelegate>*)delegate user:(NSString*)username password:(NSString *)password {
    self = [super init];
    if (self) {
        _delegate = delegate;
        [self setUsername:username password:password];
    }
    return self;
}

- (void)setUsername:(NSString*)username password:(NSString*)password {
    _username = username;
    
    NSString* loginString = [NSString stringWithFormat:@"%@:%@", username, password];
    _encodedLoginData = [RBTBase64 encode:[loginString dataUsingEncoding:NSUTF8StringEncoding]];
}

- (void)getTax:(GetTaxRequestBody*)postBody {
    NSString* url = @"https://development.avalara.net/1.0/tax/get/";
    
    ATWebCall* webCall = [[ATWebCall alloc] initWithUrl:url callbackTarget:self selector:@selector(getTaxFinished:)];
    [webCall addAuthFrom:self];
    [webCall post:[postBody toJSONString]];
}

- (void)getTaxFinished:(ATWebCall*)webCall {
    JSONModelError* error = nil;
    
    NSString* responseAsString = [webCall responseAsString];
    GetTaxResponseBody* response = [[GetTaxResponseBody alloc] initWithString:responseAsString error:&error];
    [_delegate getTaxFinished:response];
}

- (void)validateAddress:(AvaTaxAddress*)address {
    NSString *url = [NSString stringWithFormat:@"https://development.avalara.net/1.0/address/validate?Line1=%@&Line2=%@&City=%@&Region=%@&PostalCode=%@",address.Address1, address.Address2,address.City,address.State,address.Zip];
    url = [url stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    ATWebCall* webCall = [[ATWebCall alloc] initWithUrl:url callbackTarget:self selector:@selector(validateAddressFinished:)];
    [webCall addAuthFrom:self];
    [webCall get];
    
}

- (void)validateAddressFinished:(ATWebCall*)webCall {
    JSONModelError* error = nil;
    
    NSString* responseAsString = [webCall responseAsString];
    AvaTaxValidateAddressResponse* response = [[AvaTaxValidateAddressResponse alloc] initWithString:responseAsString error:&error];
    NSLog(@"%@", response);
}

@end
