//
//  AvaTaxResponse.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/16/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "AvaTaxResponse.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvaTaxResponse

- (void)setResultCodeWithNSString:(NSString*)resultCodeString {
    if ([resultCodeString isEqualToString:@"Success"]) {
        self.ResultCode = ResultCode_Success;
    } else if ([resultCodeString isEqualToString:@"Error"]) {
        self.ResultCode = ResultCode_Error;
    } else if ([resultCodeString isEqualToString:@"Warning"]) {
        self.ResultCode = ResultCode_Warning;
    } else if ([resultCodeString isEqualToString:@"Exception"]) {
        self.ResultCode = ResultCode_Exception;
    }
}

- (id)JSONObjectForResultCode {
    switch (self.ResultCode) {
        case ResultCode_Success:
            return @"Success";
        case ResultCode_Error:
            return @"Error";
        case ResultCode_Warning:
            return @"Warning";
        case ResultCode_Exception:
            return @"Exception";
        default:
            return nil;
    }
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvaTaxResponseMessage

@end
