//
//  AvaTaxResponse.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/16/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "JSONModel.h"

// http://developer.avalara.com/api-docs/rest

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxResponse : JSONModel

@property NSString* ResultCode;
@property NSArray<Optional>* Messages;

@end



///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxResponseMessage : JSONModel

@property NSString* Summary;
@property NSString* Details;
@property NSString* Severity;
@property NSString* Source;
@property NSString* RefersTo;

@end