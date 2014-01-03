//
//  GetTaxRequestBody.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/3/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONModel.h"

@class AvalaraAddress;
@class AvalaraLine;

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface GetTaxRequestBody : JSONModel
{
    
}

@property (strong,nonatomic) NSString* DocDate;
@property (strong,nonatomic) NSString* CustomerCode;
@property (strong,nonatomic) NSString* DetailLevel;
@property (strong,nonatomic) NSArray* Addresses;
@property (strong,nonatomic) NSArray* Lines;


@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvalaraAddress : JSONModel
{
    
}

@property (strong,nonatomic) NSString* AddressCode;
@property (strong,nonatomic) NSString* Line1;
@property (strong,nonatomic) NSString* Line2;
@property (strong,nonatomic) NSString* City;
@property (strong,nonatomic) NSString* Region;
@property (strong,nonatomic) NSString* PostalCode;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvalaraLine : JSONModel
{
    
}

@property (strong,nonatomic) NSString* LineNo;
@property (strong,nonatomic) NSString* DesitnationCode;
@property (strong,nonatomic) NSString* OriginCode;
@property (assign,nonatomic) int Qty;
@property (assign,nonatomic) int Amount;

@end