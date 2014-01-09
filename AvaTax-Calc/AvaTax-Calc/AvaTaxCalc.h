//
//  AvaTaxCalc.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 12/18/13.
//  Copyright (c) 2013 Avalara. All rights reserved.
//

@class GetTaxRequestBody;
@class GetTaxResponseBody;

///////////////////////////////////////////////////////////////////////////////////////////////////
@protocol AvaTaxDelegate

- (void)getTaxFinished:(GetTaxResponseBody*)response;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxCalc : NSObject
{
    NSString* _username;
    NSString* _encodedLoginData;
    
    NSObject<AvaTaxDelegate>* _delegate;
}

@property (readonly) NSString* username;

- (id)initWithDelegate:(NSObject<AvaTaxDelegate>*)delegate user:(NSString*)username password:(NSString *)password;
- (void)getTax:(GetTaxRequestBody*)postBody;

@end
