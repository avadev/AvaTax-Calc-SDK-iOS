//
//  AvaTaxEstimateTaxResponse.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 2/4/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "AvaTaxResponse.h"

@protocol AvaTaxTaxDetail
@end

/**
 * Documentation:
 * http://developer.avalara.com/api-docs/rest/tax/get
 */

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxEstimateTaxResponse : AvaTaxResponse

@property double Rate;
@property double Tax;
@property NSArray<AvaTaxTaxDetail,Optional>* TaxDetails;

@end


///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxTaxDetail : JSONModel

@property NSString* Country;
@property NSString* JurisName;
@property NSString* JurisType;
@property double Rate;
@property NSString* Region;
@property double Tax;
@property NSString* TaxName;

@end
