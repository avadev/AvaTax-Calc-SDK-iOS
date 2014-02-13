//
//  GetTaxRequestBody.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/3/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "GetTaxRequestBody.h"

NSString* const AVA_TAX_DOC_DATE_FORMAT = @"yyyy-MM-dd";

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation GetTaxRequestBody

+(BOOL)propertyIsIgnored:(NSString*)propertyName {
    if ([propertyName isEqualToString:@"Commit"]
        || [propertyName isEqualToString:@"Discount"]) {
        return YES;
    }
    
    return [super propertyIsIgnored:propertyName];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"DocType"]) {
        return YES;
    }
    
    return [super propertyIsOptional:propertyName];
}

- (void)setDetailLevelWithNSString:(NSString*)detailLevelString {
    if ([detailLevelString isEqualToString:@"Tax"]) {
        self.DetailLevel = DetailLevel_Tax;
    } else if ([detailLevelString isEqualToString:@"Document"]) {
        self.DetailLevel = DetailLevel_Document;
    } else if ([detailLevelString isEqualToString:@"Line"]) {
        self.DetailLevel = DetailLevel_Line;
    } else if ([detailLevelString isEqualToString:@"Diagnostic"]) {
        self.DetailLevel = DetailLevel_Diagnostic;
    }
}

- (id)JSONObjectForDetailLevel {
    switch (self.DetailLevel) {
        case DetailLevel_Tax:
            return @"Tax";
            break;
        case DetailLevel_Document:
            return @"Document";
            break;
        case DetailLevel_Line:
            return @"Line";
            break;
        case DetailLevel_Diagnostic:
            return @"Diagnostic";
            break;
        default:
            return nil;
            break;
    }
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
        default:
            return nil;
            break;
    }
}

// example format: "2013-06-01"
- (void)setDocDateWithNSString:(NSString*)docDateString {
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:AVA_TAX_DOC_DATE_FORMAT];
    self.DocDate = [dateFormatter dateFromString:docDateString];
}

- (id)JSONObjectForDocDate {
    if (self.DocDate == nil) {
        return nil;
    }
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:AVA_TAX_DOC_DATE_FORMAT];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    return [dateFormatter stringFromDate:self.DocDate];
}


@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvalaraLine

@end
