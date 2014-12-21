//
//  GetJsonFeedService.m
//  PacteraTest
//
//  Created by Farrukh Javeid on 12/21/14.
//
//

#import "GetJsonFeedService.h"
#import "Constants.h"
#import "InternetDetector.h"
#import "GetJsonFeedServiceOperation.h"
#import "GetJsonFeedServiceOperationRequest.h"
#import "GetJsonFeedServiceOperationResponse.h"

@interface GetJsonFeedService()
@property (assign) id<GetJsonFeedServiceDelegate> delegate;
@end

@implementation GetJsonFeedService
@synthesize delegate=_delegate;

-(id) initServiceWithDelegate:(id)delegate {
    if (self = [super init]) {
        self.delegate = delegate;
    }
    return self;
}

-(void) dealloc {
    _delegate = nil;
    [super dealloc];
}

-(void) getJsonFeed {
    if ([InternetDetector isNetAvailable]) {
     
        //internet is available, the method is a go
        
    } else {
        //internet is not available so we'll notify the user to check his internet settings
        
        [self.delegate getJsonFeedServiceFailedWithReason:INTERNET_NOT_AVAILABLE_ERROR_STRING];
    }
    
}

@end
