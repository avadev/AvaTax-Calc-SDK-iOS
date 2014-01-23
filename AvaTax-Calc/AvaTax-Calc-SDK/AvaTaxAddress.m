//
//  AvaTaxAddress.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/16/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "AvaTaxAddress.h"

@implementation AvaTaxAddress

+(BOOL)propertyIsIgnored:(NSString*)propertyName  {
    if ([propertyName isEqualToString:@"State"]) {
        return YES;
    }
    
    return [super propertyIsIgnored:propertyName];
}

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    if ([propertyName isEqualToString:@"Line1"]) {
        return NO;
    } else {
        return YES; // everything except Line1 can be optional
    }
}

- (NSString*)State {
    return self.Region;
}

- (void)setState:(NSString *)State {
    self.Region = State;
}

@end
