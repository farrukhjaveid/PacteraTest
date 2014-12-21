//
//  GetJsonFeedServiceOperationRequest.m
//  PacteraTest
//
//  Created by Farrukh Javeid on 12/21/14.
//
//

#import "GetJsonFeedServiceOperationRequest.h"

@implementation GetJsonFeedServiceOperationRequest
@synthesize delegate=_delegate;
@synthesize completionSelector=_completionSelector;
@synthesize failureSelector=_failureSelector;

-(id) initRequestWithDelegate:(id) delegate
       completionCallSelector:(SEL) completionSelector
          failureCallselector:(SEL) failureSelector {
    if (self = [super init]) {
        self.delegate = delegate;
        self.completionSelector = completionSelector;
        self.failureSelector = failureSelector;
    }
    return self;
}

-(void) dealloc {
    _delegate = nil;
    [super dealloc];
}

@end
