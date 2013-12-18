//
//  ATWebCall.m
//  AvaTax-Calc
//
//  Created by Rob Busack on 12/18/13.
//  Copyright (c) 2013 Avalara. All rights reserved.
//

NSString* const HTTP_METHOD_GET = @"GET";
NSString* const HTTP_METHOD_POST = @"POST";
NSString* const HTTP_METHOD_DELETE = @"DELETE";

#import "ATWebCall.h"
#import "AvaTaxCalc.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxCalc ()

@property (readonly) NSString* encodedLoginData;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ATWebCall

- (id)initWithUrl:(NSString*)url {
    self = [super init];
    if (self) {
        _request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    }
    return self;
}

- (void)addAuthFrom:(AvaTaxCalc*)avaTaxInterface {
    NSString* encodedLoginData = avaTaxInterface.encodedLoginData;
    NSString* authHeader = [@"Basic " stringByAppendingString:encodedLoginData];
    
   [_request addValue:authHeader forHTTPHeaderField:@"Authorization"];
}

- (void)get {
    NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:_request delegate:self];
}

- (void)post:(NSString*)body {
    [_request setHTTPMethod:HTTP_METHOD_POST];
    [_request setHTTPBody:[body dataUsingEncoding:NSUTF16StringEncoding]];
    
    NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:_request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    _receivedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[_receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"%@", [self responseAsString]);
}

- (NSString*) responseAsString {
	NSString *responseAsString = [[NSString alloc] initWithData:_receivedData encoding:NSUTF8StringEncoding];
	return responseAsString;
}

@end
