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

#import "AvaTaxWebCall.h"
#import "AvaTaxCalc.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface AvaTaxCalc ()

@property (readonly) NSString* encodedLoginData;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AvaTaxWebCall

@synthesize userObject = _userObject;

- (id)initWithUrl:(NSString*)url callbackTarget:(id)target selector:(SEL)selector {
    self = [super init];
    if (self) {
        NSAssert2([target respondsToSelector:selector], @"%@ must respond to %@", target, NSStringFromSelector(selector));
        
        _target = target;
        _selector = selector;
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
#pragma unused(connection)
}

- (void)post:(NSString*)body {
    [_request setHTTPMethod:HTTP_METHOD_POST];
    [_request setHTTPBody:[body dataUsingEncoding:NSUTF16StringEncoding]];
    
    NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:_request delegate:self];
    
#pragma unused(connection)
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    _receivedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[_receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"%@", [self responseAsString]);
    if (_target != nil && [_target respondsToSelector:_selector]) {
        [_target performSelector:_selector withObject:self];
        
        // avoiding warning "performSelector may cause a leak because its selector is unknown"
        // http://stackoverflow.com/questions/7017281/performselector-may-cause-a-leak-because-its-selector-is-unknown
//        IMP imp = [_target methodForSelector:_selector];
//        void (*func)(id, SEL) = (void*)imp;
//        func(_target, _selector);
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%@", error);
}

- (NSString*) responseAsString {
	NSString *responseAsString = [[NSString alloc] initWithData:_receivedData encoding:NSUTF8StringEncoding];
	return responseAsString;
}

@end
