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

@property NSString<Optional>*   DocCode;
@property NSDate<Optional>*     DocDate;
@property NSDate<Optional>*     Timestamp;
@property float                 TotalAmount;
@property float                 TotalDiscount;
@property float                 TotalExemption;
@property float                 TotalTaxable;
@property float                 TotalTax;
@property float                 TotalTaxCalculated;
@property NSArray<Optional>*    TaxLines;
@property NSDate<Optional>*     TaxDate;

@end
