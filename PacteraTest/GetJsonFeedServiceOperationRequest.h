//
//  GetJsonFeedServiceOperationRequest.h
//  PacteraTest
//
//  Created by Farrukh Javeid on 12/21/14.
//
//

#import <Foundation/Foundation.h>

@interface GetJsonFeedServiceOperationRequest : NSObject
@property (assign) id delegate;
@property (nonatomic) SEL completionSelector;
@property (nonatomic) SEL failureSelector;

-(id) initRequestWithDelegate:(id) delegate
       completionCallSelector:(SEL) completionSelector
          failureCallselector:(SEL) failureSelector;

@end
