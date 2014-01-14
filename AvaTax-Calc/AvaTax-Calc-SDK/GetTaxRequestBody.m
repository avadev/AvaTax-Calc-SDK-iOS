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
        || [propertyName isEqualToString:@"DocType"]
        || [propertyName isEqualToString:@"DetailLevel"]) {
        return YES;
    }
    
    return [super propertyIsIgnored:propertyName];
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvalaraAddress

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvalaraLine

@end
