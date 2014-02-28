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

+ (AvaTaxResultCode)resultCodeEnumFromString:(NSString*)resultCodeString {
    if ([resultCodeString isEqualToString:@"Success"]) {
        return ResultCode_Success;
    } else if ([resultCodeString isEqualToString:@"Error"]) {
        return ResultCode_Error;
    } else if ([resultCodeString isEqualToString:@"Warning"]) {
        return ResultCode_Warning;
    } else if ([resultCodeString isEqualToString:@"Exception"]) {
        return ResultCode_Exception;
    }
    return -1;
}

+ (NSString*)resultCodeStringFromEnum:(AvaTaxResultCode)resultCode {
    switch (resultCode) {
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

- (void)setResultCodeWithNSString:(NSString*)resultCodeString {
    self.ResultCode = [AvaTaxResponse resultCodeEnumFromString:resultCodeString];
}

- (id)JSONObjectForResultCode {
    return [AvaTaxResponse resultCodeStringFromEnum:self.ResultCode];
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvaTaxResponseMessage

- (void)setSeverityWithNSString:(NSString*)severityLevelString {
    self.Severity = [AvaTaxResponse resultCodeEnumFromString:severityLevelString];
}

- (id)JSONObjectForSeverity {
    return [AvaTaxResponse resultCodeStringFromEnum:self.Severity];
}

@end
