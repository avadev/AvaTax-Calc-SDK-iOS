//
//  AvaTaxUtil.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 2/27/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "AvaTaxUtil.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvaTaxUtil

+ (NSString*)nullNormalizedString:(NSString*)s {
    if (s == nil) {
        return nil;
    }
    
    s = [s stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (s.length == 0) {
        return nil;
    }
    if ([s isEqualToString:@"(null)"]) {
        return nil;
    }
    
    return s;
}

@end
