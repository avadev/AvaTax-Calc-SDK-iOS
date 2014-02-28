//
//  AvaTaxGetTaxRequest.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/3/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "AvaTaxGetTaxRequest.h"

NSString* const AVA_TAX_DOC_DATE_FORMAT = @"yyyy-MM-dd";

// These can't simply be an enum, since the user may create their own additional codes.
NSString* const CustomerUsageType_L_Other = @"L";
NSString* const CustomerUsageType_A_FederalGovernment = @"A";
NSString* const CustomerUsageType_B_StateGovernment = @"B";
NSString* const CustomerUsageType_C_TribeIndianStatus = @"C";
NSString* const CustomerUsageType_D_ForeignDiplomat = @"D";
NSString* const CustomerUsageType_E_CharitableBenevolent = @"E";
NSString* const CustomerUsageType_F_RegligiousEducational = @"F";
NSString* const CustomerUsageType_G_Resale = @"G";
NSString* const CustomerUsageType_H_CommercialAgricultural = @"H";
NSString* const CustomerUsageType_I_Industrial = @"I";
NSString* const CustomerUsageType_J_DirectPayPermit = @"J";
NSString* const CustomerUsageType_K_DirectMail = @"K";
NSString* const CustomerUsageType_N_LocalGovernment = @"N";
NSString* const CustomerUsageType_P_CommercialAquaculture = @"P";
NSString* const CustomerUsageType_Q_CommercialFishery = @"Q";
NSString* const CustomerUsageType_R_NonResident = @"R";

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvaTaxGetTaxRequest

+ (BOOL)propertyIsIgnored:(NSString*)propertyName {
    if ([propertyName isEqualToString:@"Commit"]) {
        return YES;
    }
    
    return [super propertyIsIgnored:propertyName];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"DocType"] ||
        [propertyName isEqualToString:@"Discount"]) {
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
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateFormat:AVA_TAX_DOC_DATE_FORMAT];
    return [dateFormatter stringFromDate:self.DocDate];
}


@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvaTaxGetTaxAddress

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"Latitude"] ||
        [propertyName isEqualToString:@"Longitude"]) {
        return YES;
    }
    
    return [super propertyIsOptional:propertyName];
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvaTaxLine

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"Discounted"] ||
        [propertyName isEqualToString:@"TaxIncluded"]) {
        return YES;
    }
    
    return [super propertyIsOptional:propertyName];
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvaTaxTaxOverride

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"TaxAmount"] ||
        [propertyName isEqualToString:@"TaxDate"]) {
        return YES;
    }
    
    return [super propertyIsOptional:propertyName];
}

- (void)setTaxOverrideTypeNSString:(NSString*)taxOverrideTypeString {
    if ([taxOverrideTypeString isEqualToString:@"None"]) {
        self.TaxOverrideType = TaxOverrideType_None;
    } else if ([taxOverrideTypeString isEqualToString:@"TaxAmount"]) {
        self.TaxOverrideType = TaxOverrideType_TaxAmount;
    } else if ([taxOverrideTypeString isEqualToString:@"Exemption"]) {
        self.TaxOverrideType = TaxOverrideType_Exemption;
    } else if ([taxOverrideTypeString isEqualToString:@"TaxDate"]) {
        self.TaxOverrideType = TaxOverrideType_TaxDate;
    }
}

- (id)JSONObjectForTaxOverrideType {
    switch (self.TaxOverrideType) {
        case TaxOverrideType_None:
            return @"None";
            break;
        case TaxOverrideType_TaxAmount:
            return @"TaxAmount";
            break;
        case TaxOverrideType_Exemption:
            return @"Exemption";
            break;
        case TaxOverrideType_TaxDate:
            return @"TaxDate";
            break;
        default:
            return nil;
            break;
    }
}

- (void)setTaxDateWithNSString:(NSString*)taxDateString {
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:AVA_TAX_DOC_DATE_FORMAT];
    self.TaxDate = [dateFormatter dateFromString:taxDateString];
}

- (id)JSONObjectForTaxDate {
    if (self.TaxDate == nil) {
        return nil;
    }
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateFormat:AVA_TAX_DOC_DATE_FORMAT];
    return [dateFormatter stringFromDate:self.TaxDate];
}

@end
