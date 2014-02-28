//
//  AvaTaxGetTaxRequest.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/3/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONModel.h"
#import "AvaTaxAddress.h"

@protocol AvaTaxGetTaxAddress
@end

@protocol AvaTaxLine
@end

@class AvaTaxTaxOverride;

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

/**
 * Documentation:
 * http://developer.avalara.com/api-docs/rest/tax/post
 */

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxGetTaxRequest : JSONModel
{
    
}

// Required for Tax Calculation
@property NSDate*   DocDate;
@property NSString* CustomerCode;
@property NSArray<AvaTaxGetTaxAddress>* Addresses;  // at least one required
@property NSArray<AvaTaxLine>* Lines;      // at least one required

//Best Practice for tax calculation
@property NSString<Optional>*   Client;
@property NSString<Optional>*   DocCode;
@property AvaTaxDocType         DocType;
@property NSString<Optional>*   CompanyCode;
@property bool                  Commit;
@property AvaTaxDetailLevel     DetailLevel;

//Use where appropriate to the situation
@property NSString<Optional>*   CustomerUsageType;
@property NSString<Optional>*   ExemptionNo;
@property float                 Discount;
@property NSString<Optional>*   BusinessIdentificationNo;
@property AvaTaxTaxOverride<Optional>*   TaxOverride;

//Optional
@property NSString<Optional>*   PurchaseOrderNo;
@property NSDate<Optional>*     PaymentDate;
@property NSString<Optional>*   PosLaneCode;
@property NSString<Optional>*   ReferenceCode;


@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxGetTaxAddress : AvaTaxAddress

@property NSString<Optional>* AddressCode;
@property float Latitude;
@property float Longitude;
@property NSString<Optional>* TaxRegionId;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxLine : JSONModel

@property NSString* LineNo;
@property NSString* DesitnationCode;
@property NSString* OriginCode;
@property NSString<Optional>* ItemCode;
@property NSString<Optional>* TaxCode;
@property NSString<Optional>* CustomeUsageType;
@property NSString<Optional>* Description;
@property float Qty;
@property float Amount;
@property BOOL Discounted;
@property BOOL TaxIncluded;
@property NSString<Optional>* Ref1;
@property NSString<Optional>* Ref2;
@property AvaTaxTaxOverride<Optional>* TaxOverride;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxTaxOverride : JSONModel

@property NSString *TaxOverrideType;   //TaxOverrideType
@property NSNumber *TaxAmount;         //decimal
@property NSDate *TaxDate;             //date
@property NSString *Reason;            //string

@end
