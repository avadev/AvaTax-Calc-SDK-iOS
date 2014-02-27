//
//  AvaTaxAddress.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/16/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "AvaTaxAddress.h"
#import "AvaTaxUtil.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
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

- (void)setLine1WithNSString:(NSString*)Line1 {
    self.Line1 = [AvaTaxUtil nullNormalizedString:Line1];
}

- (void)setLine2WithNSString:(NSString*)Line2 {
    self.Line2 = [AvaTaxUtil nullNormalizedString:Line2];
}

- (void)setLine3WithNSString:(NSString*)Line3 {
    self.Line3 = [AvaTaxUtil nullNormalizedString:Line3];
}

- (NSString*)State {
    return self.Region;
}

- (void)setState:(NSString *)State {
    self.Region = State;
}

- (NSString*)Line1Line2Line3 {
    NSMutableString* s = [[NSMutableString alloc] init];
    if (self.Line1 != nil) {
        [s appendString:self.Line1];
    }
    if (self.Line2 != nil) {
        [s appendString:@" "];
        [s appendString:self.Line2];
    }
    if (self.Line3 != nil) {
        [s appendString:@" "];
        [s appendString:self.Line3];
    }
    return [s stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
