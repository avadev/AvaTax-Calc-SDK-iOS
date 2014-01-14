//
//  GetTaxRequestBody.h
//  AvaTax-Calc
//
//  Created by Rob Busack on 1/3/14.
//  Copyright (c) 2014 Avalara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONModel.h"

@class AvalaraAddress;
@class AvalaraLine;
@class RBTAvaTaxTaxOverride;

typedef enum {
    SalesOrder,
    SalesInvoice,
    ReturnOrder,
    ReturnInvoice,
    PurchaseOrder,
    PurchaseInvoice
} DocType;
typedef enum  {
    Tax,
    Document,
    Line,
    Diagnostic
} DetailLevel;
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
@interface GetTaxRequestBody : JSONModel
{
    
}

// Required for Tax Calculation
@property NSString* DocDate;
@property NSString* CustomerCode;
@property NSArray*  Addresses;
@property NSArray*  Lines;

//Best Practice for tax calculation
@property NSString<Optional>*   Client;
@property NSString<Optional>*   DocCode;
@property NSNumber<Optional>*   DocType;
@property NSString<Optional>*   CompanyCode;
@property bool                  Commit;
@property DetailLevel DetailLevel;

//Use where appropriate to the situation
@property NSString<Optional>*   CustomerUsageType;
@property NSString<Optional>*   ExemptionNo;
@property int                   Discount;
@property NSString<Optional>*   BusinessIdentificationNo;
@property RBTAvaTaxTaxOverride<Optional>*   TaxOverride;

//Optional
@property NSString<Optional>*   PurchaseOrderNo;
@property NSDate<Optional>*     PaymentDate;
@property NSString<Optional>*   PosLaneCode;
@property NSString<Optional>*   ReferenceCode;


@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvalaraAddress : JSONModel

@property NSString* AddressCode;
@property NSString* Line1;
@property NSString* Line2;
@property NSString* City;
@property NSString* Region;
@property NSString* PostalCode;

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