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

+ (NSDate*)dateForYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day {
	return [AvaTaxUtil dateForYear:year month:month day:day hour:0 minute:0 second:0];
}

+ (NSDate*)dateForYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day
				  hour:(NSUInteger)hour minute:(NSUInteger)minute second:(NSUInteger)second {
    
	NSDateComponents *components = [[NSDateComponents alloc] init];
	[components setSecond:second];
	[components setMinute:minute];
	[components setHour:hour];
	[components setDay:day];
	[components setMonth:month];
	[components setYear:year];
	
	NSDate* date = [[NSCalendar currentCalendar] dateFromComponents:components];
	return date;
}

@end
