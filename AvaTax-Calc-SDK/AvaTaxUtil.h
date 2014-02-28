//
//  AvaTaxUtil.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 2/27/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//


///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxUtil : NSObject

+ (NSString*)nullNormalizedString:(NSString*)s;

+ (NSDate*)dateForYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day;
+ (NSDate*)dateForYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day
				  hour:(NSUInteger)hour minute:(NSUInteger)minute second:(NSUInteger)second;

@end
