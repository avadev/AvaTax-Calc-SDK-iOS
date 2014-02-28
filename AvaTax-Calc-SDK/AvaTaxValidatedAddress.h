//
//  AvaTaxValidatedAddress.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/16/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "AvaTaxAddress.h"

typedef enum {
    AddressType_F,
    AddressType_G,
    AddressType_H,
    AddressType_P,
    AddressType_R,
    AddressType_S
} AvaTaxAddressType;

/**
 * Documentation:
 * http://developer.avalara.com/api-docs/rest/address-validation
 */

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxValidatedAddress : AvaTaxAddress

@property AvaTaxAddressType AddressType;    // Enumeration {F,G,H,P,R,S}
@property NSString* County;
@property NSString* FipsCode;
@property NSString* CarrierRoute;   // starts with B,C,G,H,R
@property NSString* TaxRegionId;
@property NSString* PostNet;

@end
