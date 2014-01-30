//
//  GetTaxResponseBody.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/8/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "AvaTaxResponse.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface GetTaxResponseBody : AvaTaxResponse

@property NSString<Optional>* DocCode;
@property NSString<Optional>* DocDate;  // TODO: see if we can use an NSDate object
@property NSString<Optional>* Timestamp;
@property NSString<Optional>* TotalAmount;  // TODO:  get these to be floats
@property NSString<Optional>* TotalDiscount;
@property NSString<Optional>* TotalExemption;
@property NSString<Optional>* TotalTaxable;
@property NSString<Optional>* TotalTax;
@property NSString<Optional>* TotalTaxCalculated;
@property NSString<Optional>* TaxDate;

@end
