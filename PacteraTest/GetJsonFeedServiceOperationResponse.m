//
//  GetJsonFeedServiceOperationResponse.m
//  PacteraTest
//
//  Created by Farrukh Javeid on 12/21/14.
//
//

#import "GetJsonFeedServiceOperationResponse.h"

@implementation GetJsonFeedServiceOperationResponse
@synthesize responseArray=_responseArray;
@synthesize titleString=_titleString;

-(id) init {
    if (self = [super init]) {

        //var init
        NSArray *responseArray = [[NSArray alloc] init];
        self.responseArray = responseArray;
        [responseArray release];
        
        NSString *titleString = [[NSString alloc] init];
        self.titleString = titleString;
        [titleString release];
    }
    return self;
}

-(void) dealloc {
    [_responseArray release];
    _responseArray = nil;
    [_titleString release];
    _titleString = nil;
    [super dealloc];
}

@end
