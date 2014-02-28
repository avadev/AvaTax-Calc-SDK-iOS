//
//  AvaTaxCancelTaxRequest.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/27/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "AvaTaxCancelTaxRequest.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvaTaxCancelTaxRequest

- (void)setCancelCodeWithNSString:(NSString*)cancelCodeString {
    if ([cancelCodeString isEqualToString:@"Unspecified"]) {
        self.CancelCode = CancelCode_Unspecified;
    } else if ([cancelCodeString isEqualToString:@"PostFailed"]) {
        self.CancelCode = CancelCode_PostFailed;
    } else if ([cancelCodeString isEqualToString:@"DocDeleted"]) {
        self.CancelCode = CancelCode_DocDeleted;
    } else if ([cancelCodeString isEqualToString:@"DocVoided"]) {
        self.CancelCode = CancelCode_DocVoided;
    } else if ([cancelCodeString isEqualToString:@"AdjustmentCancelled"]) {
        self.CancelCode = CancelCode_AdjustmentCancelled;
    }
}

- (id)JSONObjectForCancelCode {
    switch (self.CancelCode) {
        case CancelCode_Unspecified:
            return @"Unspecified";
            break;
        case CancelCode_PostFailed:
            return @"PostFailed";
            break;
        case CancelCode_DocDeleted:
            return @"DocDeleted";
            break;
        case CancelCode_DocVoided:
            return @"DocVoided";
            break;
        case CancelCode_AdjustmentCancelled:
            return @"AdjustmentCancelled";
            break;
        default:
            return nil;
            break;
    }
}

@end
