//
//  CancelTaxRequestBody.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/27/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import "JSONModel.h"
#import "AvaTaxGetTaxRequest.h"

typedef enum {
    CancelCode_Unspecified,
    CancelCode_PostFailed,
    CancelCode_DocDeleted,
    CancelCode_DocVoided,
    CancelCode_AdjustmentCancelled
} AvaTaxCancelCode;

/**
 * Documentation:
 * http://developer.avalara.com/api-docs/rest/tax/cancel
 */

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxCancelTaxRequest : JSONModel

@property NSString<Optional>*   CompanyCode;
@property AvaTaxDocType         DocType;
@property NSString<Optional>*   DocCode;
@property AvaTaxCancelCode      CancelCode;
@property NSString<Optional>*   DocId;

@end
