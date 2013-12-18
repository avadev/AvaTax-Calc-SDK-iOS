//
//  SampleGetTaxCall.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 12/16/13.
//  Copyright (c) 2013 Avalara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SampleGetTaxCall : NSObject < NSURLConnectionDelegate >
{
    NSMutableData* receivedData;
}

- (void)performGetTaxRequest;

@end
