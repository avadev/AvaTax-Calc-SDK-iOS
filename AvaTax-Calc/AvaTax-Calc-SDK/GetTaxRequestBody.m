//
//  GetTaxRequestBody.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/3/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "GetTaxRequestBody.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation GetTaxRequestBody

+(BOOL)propertyIsIgnored:(NSString*)propertyName {
    if ([propertyName isEqualToString:@"Commit"]
        || [propertyName isEqualToString:@"Discount"]
        || [propertyName isEqualToString:@"DocType"]) {
        return YES;
    }
    
    return [super propertyIsIgnored:propertyName];
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


@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvalaraAddress

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvalaraLine

@end
