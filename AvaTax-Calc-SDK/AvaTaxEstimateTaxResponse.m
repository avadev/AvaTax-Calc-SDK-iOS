//
//  AvaTaxEstimateTaxResponse.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 2/4/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "AvaTaxEstimateTaxResponse.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvaTaxEstimateTaxResponse

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"Tax"] ||
        [propertyName isEqualToString:@"Rate"]) {
        return YES;
    }
    
    return [super propertyIsOptional:propertyName];
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvaTaxTaxDetail

@end