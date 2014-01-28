//
//  AvaTaxCalc.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 12/18/13.
//  Copyright (c) 2013 Avalara. All rights reserved.
//

@class GetTaxRequestBody;
@class GetTaxResponseBody;
@class AvaTaxAddress;
@class AvaTaxValidateAddressResponse;
@class CancelTaxRequestBody;
@class AvaTaxCancelTaxResponse;

///////////////////////////////////////////////////////////////////////////////////////////////////
@protocol AvaTaxGetTaxDelegate

- (void)getTaxFinished:(GetTaxResponseBody*)response;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@protocol AvaTaxValidateAddressDelegate

- (void)validateAddressFinished:(AvaTaxValidateAddressResponse*)response;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@protocol AvaTaxCancelTaxDelegate

- (void)cancelTaxFinished:(AvaTaxCancelTaxResponse*)response;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxCalc : NSObject
{
    NSString* _username;
    NSString* _encodedLoginData;
}

@property (readonly) NSString* username;

- (id)initWithUser:(NSString*)username password:(NSString *)password;
- (void)getTax:(GetTaxRequestBody*)postBody callback:(NSObject<AvaTaxGetTaxDelegate>*)callback;
- (void)validateAddress:(AvaTaxAddress*)address callback:(NSObject<AvaTaxValidateAddressDelegate>*)callback;
- (void)cancelTax:(CancelTaxRequestBody*)cancelBody callback:(NSObject<AvaTaxCancelTaxDelegate>*)callback;

@end
