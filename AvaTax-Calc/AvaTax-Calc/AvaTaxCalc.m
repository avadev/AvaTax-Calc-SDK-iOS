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

- (void)getTax:(NSString*)postBody {
    NSString* url = @"https://development.avalara.net/1.0/tax/get/";
    
    ATWebCall* webCall = [[ATWebCall alloc] initWithUrl:url];
    [webCall addAuthFrom:self];
    [webCall post:postBody];
}

@end
