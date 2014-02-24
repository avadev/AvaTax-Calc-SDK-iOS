//
//  AvaTaxGetTaxRequest.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/3/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONModel.h"

@class AvaTaxAddress;
@class AvalaraLine;
@class RBTAvaTaxTaxOverride;

extern NSString* const AVA_TAX_DOC_DATE_FORMAT;

typedef enum {
    DocType_SalesOrder,
    DocType_SalesInvoice,
    DocType_ReturnOrder,
    DocType_ReturnInvoice,
    DocType_PurchaseOrder,
    DocType_PurchaseInvoice
} AvaTaxDocType;
typedef enum  {
    DetailLevel_Tax,
    DetailLevel_Document,
    DetailLevel_Line,
    DetailLevel_Diagnostic
} AvaTaxDetailLevel;
typedef enum {
    L,  //"Other",
    A,  //"Federal government",
    B,  //"State government",
    C,  //"Tribe / Status Indian / Indian Band",
    D,  //"Foreign diplomat",
    E,  //"Charitable or benevolent organization",
    F,  //"Regligious or educational organization",
    G,  //"Resale",
    H,  //"Commercial agricultural production",
    I,  // "Industrial production / manufacturer",
    J,  // "Direct pay permit",
    K,  // "Direct Mail",
    N,  // "Local Government",
    P,  // "Commercial Aquaculture",
    Q,  // "Commercial Fishery",
    R   // "Non-resident"
} SystemCustomerUsageType;

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxGetTaxRequest : JSONModel
{
    
}

// Required for Tax Calculation
@property NSDate*   DocDate;
@property NSString* CustomerCode;
@property NSArray*  Addresses;  // at least one required
@property NSArray*  Lines;      // at least one required

//Best Practice for tax calculation
@property NSString<Optional>*   Client;
@property NSString<Optional>*   DocCode;
@property AvaTaxDocType         DocType;
@property NSString<Optional>*   CompanyCode;
@property bool                  Commit;
@property AvaTaxDetailLevel     DetailLevel;

//Use where appropriate to the situation
@property NSString<Optional>*   CustomerUsageType;  // TODO: do we want to use an enum for this?
@property NSString<Optional>*   ExemptionNo;
@property float                 Discount;
@property NSString<Optional>*   BusinessIdentificationNo;
@property RBTAvaTaxTaxOverride<Optional>*   TaxOverride;

//Optional
@property NSString<Optional>*   PurchaseOrderNo;
@property NSDate<Optional>*     PaymentDate;
@property NSString<Optional>*   PosLaneCode;
@property NSString<Optional>*   ReferenceCode;


@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvalaraLine : JSONModel

@property NSString* LineNo;
@property NSString* DesitnationCode;
@property NSString* OriginCode;
@property int Qty;
@property int Amount;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface RBTAvaTaxTaxOverride : JSONModel

@property NSString *TaxOverrideType;   //TaxOverrideType
@property NSNumber *TaxAmount;         //decimal
@property NSDate *TaxDate;             //date
@property NSString *Reason;            //string

@end
