//
//  AvaTaxCalc.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 12/18/13.
//  Copyright (c) 2013 Avalara. All rights reserved.
//


///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxCalc : NSObject
{
    NSString* _username;
    NSString* _encodedLoginData;
}

@property (readonly) NSString* username;

- (id)initWithUser:(NSString*)username password:(NSString *)password;
- (void)getTax:(NSString*)postBody;

@end
