//
//  GetJsonFeedServiceOperation.m
//  PacteraTest
//
//  Created by Farrukh Javeid on 12/21/14.
//
//

#import "GetJsonFeedServiceOperation.h"
#import "Constants.h"
#import "GetJsonFeedServiceOperationRequest.h"
#import "GetJsonFeedServiceOperationResponse.h"
#import "GetJsonFeedServiceOperationTranslator.h"

@interface GetJsonFeedServiceOperation()
@property (nonatomic, retain) GetJsonFeedServiceOperationRequest *request;
@property (nonatomic, retain) GetJsonFeedServiceOperationResponse *response;

-(void) callTarget:(id)target Selector:(SEL)selector WithObject:(id)object;
@end

@implementation GetJsonFeedServiceOperation
@synthesize request=_request;
@synthesize response=_response;

-(id) initOperationWithRequest:(GetJsonFeedServiceOperationRequest *)request {
    if (self = [super init]) {
        self.request = request;
        GetJsonFeedServiceOperationResponse *response = [[GetJsonFeedServiceOperationResponse alloc] init];
        self.response = response;
        [response dealloc];
    }
    return self;
}

-(void) main {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:GET_JSON_FEED_URL_STRING]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [url release];

    [request setHTTPMethod:@"GET"];
    [request setTimeoutInterval:30];
    
    NSHTTPURLResponse* response;
    NSError* error = nil;
    
    NSData* webData =[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (!error) {
        
        if (response.statusCode != 200) {
            [self callTarget:self.request.delegate Selector:self.request.failureSelector WithObject:SOMETHING_WENT_WRONG_ERROR_STRING];
            return;
        }
        
        
        self.response = [GetJsonFeedServiceOperationTranslator getResultsFromJsonString:jsonString];
        [self callTarget:self.request.delegate Selector:self.request.completionSelector WithObject:self.response];
        
    } else {
        [self callTarget:self.request.delegate Selector:self.request.failureSelector WithObject:SOMETHING_WENT_WRONG_ERROR_STRING];
    }
}

-(void) callTarget:(id)target Selector:(SEL)selector WithObject:(id)object
{
    if(target != nil && selector != nil)
    {
        if([target respondsToSelector:selector])
        {
            [target performSelectorOnMainThread:selector withObject:object waitUntilDone:NO];
        }
    }
}

@end
