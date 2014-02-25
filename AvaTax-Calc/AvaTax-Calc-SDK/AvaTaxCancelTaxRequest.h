//
//  CancelTaxRequestBody.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/27/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "JSONModel.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxCancelTaxRequest : JSONModel

@property NSString* CompanyCode;
@property NSString* DocType;
@property NSString* DocCode;
@property NSString* CancelCode;

@end
