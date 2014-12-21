//
//  GetJsonFeedService.h
//  PacteraTest
//
//  Created by Farrukh Javeid on 12/21/14.
//
//

#import "GenericService.h"

@protocol GetJsonFeedServiceDelegate;

@interface GetJsonFeedService : GenericService
-(id) initServiceWithDelegate:(id)delegate;
-(void) getJsonFeed;
@end


@protocol GetJsonFeedServiceDelegate <NSObject>
-(void) getJsonFeedServiceSuccessfullyCompletedWithResponse:(NSArray *)responseArray;
-(void) getJsonFeedServiceFailedWithReason:(NSString *)reason;
@end