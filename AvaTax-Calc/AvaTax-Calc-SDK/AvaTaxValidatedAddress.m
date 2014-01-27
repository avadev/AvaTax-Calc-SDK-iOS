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

- (void)setCarrierRouteWithNSString:(NSString*)carrierRouteString {
    if ([carrierRouteString isEqualToString:@"B"]) {
        self.CarrierRoute = CarrierRoute_B;
    } else if ([carrierRouteString isEqualToString:@"C"]) {
        self.CarrierRoute = CarrierRoute_C;
    } else if ([carrierRouteString isEqualToString:@"G"]) {
        self.CarrierRoute = CarrierRoute_G;
    } else if ([carrierRouteString isEqualToString:@"H"]) {
        self.CarrierRoute = CarrierRoute_H;
    } else if ([carrierRouteString isEqualToString:@"R"]) {
        self.CarrierRoute = CarrierRoute_R;
    }
}

- (id)JSONObjectForCarrierRoute {
    switch (self.CarrierRoute) {
        case CarrierRoute_B:
            return @"B";
            break;
        case CarrierRoute_C:
            return @"C";
            break;
        case CarrierRoute_G:
            return @"G";
            break;
        case CarrierRoute_H:
            return @"H";
            break;
        case CarrierRoute_R:
            return @"R";
            break;
        default:
            return nil;
            break;
    }
}

@end
