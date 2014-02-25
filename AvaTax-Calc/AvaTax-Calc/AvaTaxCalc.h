//
//  AvaTaxCalc.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 12/18/13.
//  Copyright (c) 2013 Avalara. All rights reserved.
//

@class AvaTaxGetTaxRequest;
@class AvaTaxGetTaxResponse;
@class AvaTaxAddress;
@class AvaTaxValidateAddressResponse;
@class AvaTaxCancelTaxRequest;
@class AvaTaxCancelTaxResponse;
@class TaxSummaryRequestBody;
@class TaxSummaryResponse;
@class AvaTaxEstimateTaxResponse;

///////////////////////////////////////////////////////////////////////////////////////////////////
@protocol AvaTaxGetTaxDelegate

- (void)getTaxFinished:(AvaTaxGetTaxResponse*)response;

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
@protocol AvaTaxTaxSummaryDelegate

- (void)getTaxSummaryFinished:(TaxSummaryResponse*)response;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@protocol AvaTaxEstimateTaxDelegate

- (void)estimateTaxFinished:(AvaTaxEstimateTaxResponse*)response;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxCalc : NSObject
{
    NSString* _username;
    NSString* _encodedLoginData;
    
    BOOL _useDevServer;
}

@property (readonly) NSString* username;

- (id)initWithUser:(NSString*)username password:(NSString *)password development:(BOOL)devServersNotProd;
- (void)getTax:(AvaTaxGetTaxRequest*)postBody callback:(NSObject<AvaTaxGetTaxDelegate>*)callback;
- (void)validateAddress:(AvaTaxAddress*)address callback:(NSObject<AvaTaxValidateAddressDelegate>*)callback;
- (void)cancelTax:(AvaTaxCancelTaxRequest*)cancelBody callback:(NSObject<AvaTaxCancelTaxDelegate>*)callback;
- (void)getTaxSummary:(TaxSummaryRequestBody*)taxSummaryRequest callback:(NSObject<AvaTaxTaxSummaryDelegate>*)callback;
- (void)estimateTaxForSaleAmount:(double)saleAmount latitude:(double)latitude longitude:(double)longitude callback:(NSObject<AvaTaxEstimateTaxDelegate>*)callback;

@end
