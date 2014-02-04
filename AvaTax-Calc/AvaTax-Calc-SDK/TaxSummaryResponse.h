//
//  TaxSummaryResponse.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 2/4/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "AvaTaxResponse.h"

@class AvaTaxTaxSummary;

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface TaxSummaryResponse : AvaTaxResponse

@property NSString* MerchantCode;
@property NSString* PeriodStart;
@property NSString* PeriodEnd;
@property NSString* ReportDate;
@property NSString* TaxType;
@property NSArray* TaxSummaries;    // contains AvaTaxTaxSummary objects

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxTaxSummary : JSONModel

@property NSString* Country;
@property NSString* Region;
@property NSString* JurisdictionType;
@property NSString* Jurisdiction;
@property NSString* SalesAmount;
@property NSString* SalesLessDiscounts;
@property NSString* TaxableFreight;
@property NSString* ExcemptSales;
@property NSString* NonTaxableSales;
@property NSString* NonTaxableFreight;
@property NSString* TotalExemptNonTaxableSales;
@property NSString* TotalTaxableSales;
@property NSString* TaxRate;
@property NSString* TaxAmount;

@end
