//
//  SampleGetTaxCall.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 12/16/13.
//  Copyright (c) 2013 Avalara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AvaTaxCalc.h"

@interface SampleGetTaxCall : NSObject < NSURLConnectionDelegate, AvaTaxDelegate >
{
    NSMutableData* receivedData;
}

- (void)performGetTaxRequest;

@end
