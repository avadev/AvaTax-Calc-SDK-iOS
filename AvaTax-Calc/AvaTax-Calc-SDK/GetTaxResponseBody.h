//
//  GetTaxResponseBody.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/8/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "JSONModel.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface GetTaxResponseBody : JSONModel

@property NSString* ResultCode;
@property NSArray<Optional>* Messages;
@property NSString<Optional>* DocCode;
@property NSString<Optional>* DocDate;
@property NSString<Optional>* Timestamp;
@property NSString<Optional>* TotalAmount;
@property NSString<Optional>* TotalDiscount;
@property NSString<Optional>* TotalExemption;
@property NSString<Optional>* TotalTaxable;
@property NSString<Optional>* TotalTax;
@property NSString<Optional>* TotalTaxCalculated;
@property NSString<Optional>* TaxDate;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface GetTaxResultMessage : JSONModel

@property NSString* Summary;
@property NSString* Details;
@property NSString* Severity;
@property NSString* Source;
@property NSString* RefersTo;

@end
