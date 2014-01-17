//
//  AvaTaxValidatedAddress.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/16/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "AvaTaxAddress.h"

@interface AvaTaxValidatedAddress : AvaTaxAddress

@property NSString *County;
@property NSString *FipsCode;
@property NSString *CarrierRoute;
@property NSString *PostNet;
@property NSString *AddressType;
@property NSString *Region;

@end
