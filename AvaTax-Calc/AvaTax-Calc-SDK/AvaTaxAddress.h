//
//  AvaTaxAddress.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/16/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "JSONModel.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxAddress : JSONModel

@property NSString *AddressCode;
@property NSString *Address1;
@property NSString *Address2;
@property NSString *Address3;
@property NSString *City;
@property NSString *State;
@property NSString *Zip;
@property NSString *Country;

//@property NSString *ValAddress1;
//@property NSString *ValAddress2;
//@property NSString *ValCity;
//@property NSString *ValState;
//@property NSString *ValZip;
//@property NSString *ValCounty;
//@property NSString *ValFipsCode;
//@property NSString *ValCarrierRoute;
//@property NSString *ValPostNet;
//@property NSString *ValAddressType;

@end
