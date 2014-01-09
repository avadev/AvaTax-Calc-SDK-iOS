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
    
    id _target;
    SEL _selector;
}

- (id)initWithUrl:(NSString*)url callbackTarget:(id)target selector:(SEL)selector;
- (void)addAuthFrom:(AvaTaxCalc*)avaTaxInterface;
- (void)get;
- (void)post:(NSString*)body;

- (NSString*) responseAsString;

@end
