//
//  AvaTaxValidatedAddress.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/16/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "AvaTaxValidatedAddress.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvaTaxValidatedAddress

- (void)setAddressTypeWithNSString:(NSString*)addressTypeString {
    if ([addressTypeString isEqualToString:@"F"]) {
        self.AddressType = AddressType_F;
    } else if ([addressTypeString isEqualToString:@"G"]) {
        self.AddressType = AddressType_G;
    } else if ([addressTypeString isEqualToString:@"H"]) {
        self.AddressType = AddressType_H;
    } else if ([addressTypeString isEqualToString:@"P"]) {
        self.AddressType = AddressType_P;
    } else if ([addressTypeString isEqualToString:@"R"]) {
        self.AddressType = AddressType_R;
    } else if ([addressTypeString isEqualToString:@"S"]) {
        self.AddressType = AddressType_S;
    }
}

- (id)JSONObjectForAddressType {
    switch (self.AddressType) {
        case AddressType_F:
            return @"F";
            break;
        case AddressType_G:
            return @"G";
            break;
        case AddressType_H:
            return @"H";
            break;
        case AddressType_P:
            return @"P";
            break;
        case AddressType_R:
            return @"R";
            break;
        case AddressType_S:
            return @"S";
            break;
        default:
            return nil;
            break;
    }
}


@end
