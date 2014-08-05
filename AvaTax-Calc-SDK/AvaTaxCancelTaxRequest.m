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

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"DocType"]) {
        return YES;
    }
    
    return [super propertyIsOptional:propertyName];
}


- (void)setDocTypeNSString:(NSString*)docTypeString {
    if ([docTypeString isEqualToString:@"SalesOrder"]) {
        self.DocType = DocType_SalesOrder;
    } else if ([docTypeString isEqualToString:@"SalesInvoice"]) {
        self.DocType = DocType_SalesInvoice;
    } else if ([docTypeString isEqualToString:@"ReturnOrder"]) {
        self.DocType = DocType_ReturnOrder;
    } else if ([docTypeString isEqualToString:@"ReturnInvoice"]) {
        self.DocType = DocType_ReturnInvoice;
    } else if ([docTypeString isEqualToString:@"PurchaseOrder"]) {
        self.DocType = DocType_PurchaseOrder;
    } else if ([docTypeString isEqualToString:@"PurchaseInvoice"]) {
        self.DocType = DocType_PurchaseInvoice;
    } else if ([docTypeString isEqualToString:@"ReverseChargeOrder"]) {
        self.DocType = DocType_ReverseChargeOrder;
    } else if ([docTypeString isEqualToString:@"ReverseChargeInvoice"]) {
        self.DocType = DocType_ReverseChargeInvoice;
    }
}

- (id)JSONObjectForDocType {
    switch (self.DocType) {
        case DocType_SalesOrder:
            return @"SalesOrder";
            break;
        case DocType_SalesInvoice:
            return @"SalesInvoice";
            break;
        case DocType_ReturnOrder:
            return @"ReturnOrder";
            break;
        case DocType_ReturnInvoice:
            return @"ReturnInvoice";
            break;
        case DocType_PurchaseOrder:
            return @"PurchaseOrder";
            break;
        case DocType_PurchaseInvoice:
            return @"PurchaseInvoice";
            break;
        case DocType_ReverseChargeOrder:
            return @"ReverseChargeOrder";
            break;
        case DocType_ReverseChargeInvoice:
            return @"ReverseChargeInvoice";
            break;
        default:
            return nil;
            break;
    }
}

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
