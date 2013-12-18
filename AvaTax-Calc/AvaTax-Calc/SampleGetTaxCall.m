//
//  SampleGetTaxCall.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 12/16/13.
//  Copyright (c) 2013 Avalara. All rights reserved.
//

#import "SampleGetTaxCall.h"
#import "RBTBase64.h"

@implementation SampleGetTaxCall

- (NSString*)samplePostJson {
    
    NSString* json = @"{ 'DocDate': '2013-05-13', 'CustomerCode': 'CUST1', 'DetailLevel':'Document', 'Addresses':[ { 'AddressCode': '1', 'Line1': '100 Ravine Ln', 'Line2': '', 'City': 'Bainbridge Island', 'Region': 'WA', 'PostalCode': '98110' }], 'Lines':[ { 'LineNo': '1', 'DestinationCode': '1', 'OriginCode': '1', 'Qty': 1, 'Amount': 100 }] }";
    
    return json;

}

- (void)performGetTaxRequest {
    NSString* url = @"https://development.avalara.net/1.0/tax/get/";
    NSString* userName = @"rob.busack";
    NSString* password = @"";
    NSString* loginString = [NSString stringWithFormat:@"%@:%@", userName, password];
    NSString* encodedLoginData = [RBTBase64 encode:[loginString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSString* authHeader = [@"Basic " stringByAppendingString:encodedLoginData];
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[[self samplePostJson] dataUsingEncoding:NSUTF16StringEncoding]];
    [request addValue:authHeader forHTTPHeaderField:@"Authorization"];
    
    
    
    // need to release this later
    NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {

    receivedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"%@", [self responseAsString]);
}

- (NSString*) responseAsString {
	NSString *responseAsString = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
	return responseAsString;
}

@end
