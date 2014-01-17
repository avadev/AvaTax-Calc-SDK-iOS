//
//  AvaTaxValidateAddressResponse.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/16/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "AvaTaxResponse.h"
#import "AvaTaxValidatedAddress.h"

@interface AvaTaxValidateAddressResponse : AvaTaxResponse

@property AvaTaxValidatedAddress *Address;

@end
