//
//  ATWebCall.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 12/18/13.
//  Copyright (c) 2013 Avalara. All rights reserved.
//

@class AvaTaxCalc;

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface ATWebCall : NSObject < NSURLConnectionDelegate >
{
    NSMutableURLRequest* _request;
    NSMutableData* _receivedData;
}

- (id)initWithUrl:(NSString*)url;
- (void)addAuthFrom:(AvaTaxCalc*)avaTaxInterface;
- (void)get;
- (void)post:(NSString*)body;

@end
