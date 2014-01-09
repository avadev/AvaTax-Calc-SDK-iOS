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
{
    
}

@property (strong,nonatomic) NSString* ResultCode;
@property (strong,nonatomic) NSString* DocCode;
@property (strong,nonatomic) NSString* DocDate;
@property (strong,nonatomic) NSString* Timestamp;
@property (strong,nonatomic) NSString* TotalAmount;
@property (strong,nonatomic) NSString* TotalDiscount;
@property (strong,nonatomic) NSString* TotalExemption;
@property (strong,nonatomic) NSString* TotalTaxable;
@property (strong,nonatomic) NSString* TotalTax;
@property (strong,nonatomic) NSString* TotalTaxCalculated;
@property (strong,nonatomic) NSString* TaxDate;

@end