//
//  AvaTaxValidateAddressResponse.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/16/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "AvaTaxValidateAddressResponse.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvaTaxValidateAddressResponse

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    if ([propertyName isEqualToString:@"Address"]) {
        return YES;
    } else {
        return [super propertyIsOptional:propertyName];
    }
}

@end
