//
//  AvaTaxGetTaxResponse.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/8/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "AvaTaxGetTaxResponse.h"
#import "AvaTaxGetTaxRequest.h"

static NSString* const AVA_TAX_TIMESTAMP_FORMAT = @"yyyy-MM-dd'T'HH:mm:ssZ";
static NSString* const AVA_TAX_TAX_DATE_FORMAT = @"yyyy-MM-dd";

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvaTaxGetTaxResponse

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"TotalAmount"] ||
        [propertyName isEqualToString:@"TotalDiscount"] ||
        [propertyName isEqualToString:@"TotalExemption"] ||
        [propertyName isEqualToString:@"TotalTaxable"] ||
        [propertyName isEqualToString:@"TotalTax"] ||
        [propertyName isEqualToString:@"TotalTaxCalculated"]) {
        return YES;
    }
    
    return [super propertyIsOptional:propertyName];
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

// example format: "2013-06-18T18:08:37.6532578Z"
- (void)setTimestampWithNSString:(NSString*)timestampString {
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:AVA_TAX_TIMESTAMP_FORMAT];
    self.DocDate = [dateFormatter dateFromString:timestampString];
}

- (id)JSONObjectForTimestamp {
    if (self.Timestamp == nil) {
        return nil;
    }
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:AVA_TAX_TIMESTAMP_FORMAT];
    return [dateFormatter stringFromDate:self.Timestamp];
}

// example format: "2013-06-01"
- (void)setTaxDateWithNSString:(NSString*)taxDateString {
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:AVA_TAX_TAX_DATE_FORMAT];
    self.TaxDate = [dateFormatter dateFromString:taxDateString];
}

- (id)JSONObjectForTaxDate {
    if (self.TaxDate == nil) {
        return nil;
    }
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:AVA_TAX_TAX_DATE_FORMAT];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    return [dateFormatter stringFromDate:self.TaxDate];
}


@end
