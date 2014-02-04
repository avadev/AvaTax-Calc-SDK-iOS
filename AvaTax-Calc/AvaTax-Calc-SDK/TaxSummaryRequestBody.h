//
//  TaxSummaryRequestBody.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 2/4/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "JSONModel.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface TaxSummaryRequestBody : JSONModel

@property NSString* MerchantCode;
@property NSString* StartDate;
@property NSString* EndDate;

@end
