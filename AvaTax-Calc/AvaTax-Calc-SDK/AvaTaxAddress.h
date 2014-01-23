//
//  AvaTaxAddress.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/16/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "JSONModel.h"

// http://developer.avalara.com/api-docs/rest/address-validation

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxAddress : JSONModel

//@property NSString *AddressCode;
@property NSString *Line1;  // Address line 1
@property NSString *Line2;
@property NSString *Line3;
@property NSString *City;
@property NSString *Region; // State
@property NSString *PostalCode;
@property NSString *Country;

@property NSString *State;  // this gets & sets Region under the hood

@end
