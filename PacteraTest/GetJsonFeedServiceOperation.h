//
//  GetJsonFeedServiceOperation.h
//  PacteraTest
//
//  Created by Farrukh Javeid on 12/21/14.
//
//

#import <Foundation/Foundation.h>
@class GetJsonFeedServiceOperationRequest;
@interface GetJsonFeedServiceOperation : NSOperation
-(id) initOperationWithRequest:(GetJsonFeedServiceOperationRequest *)request;
@end
