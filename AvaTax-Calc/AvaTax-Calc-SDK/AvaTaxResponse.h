//
//  AvaTaxResponse.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/16/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "JSONModel.h"

typedef enum {
    ResultCode_Success,
    ResultCode_Error,
    ResultCode_Warning,
    ResultCode_Exception
} AvaTaxResultCode;

/**
 * Documentation:
 * http://developer.avalara.com/api-docs/rest
 * http://developer.avalara.com/api-docs/soap/shared-formats-and-methods
 */

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxResponse : JSONModel

@property AvaTaxResultCode ResultCode;
@property NSArray<Optional>* Messages;  // contains NSDictionary instances.  You should alloc/init an AvaTaxResponseMessage for each dictionary you want to access.

@end



///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxResponseMessage : JSONModel

@property NSString* Summary;
@property NSString* Details;
@property NSString* Severity;
@property NSString* Source;
@property NSString* RefersTo;

@end