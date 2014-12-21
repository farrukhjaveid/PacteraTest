//
//  GetJsonFeedServiceOperationTranslator.h
//  PacteraTest
//
//  Created by Farrukh Javeid on 12/21/14.
//
//

#import <Foundation/Foundation.h>
@class GetJsonFeedServiceOperationResponse;
@interface GetJsonFeedServiceOperationTranslator : NSObject
+(GetJsonFeedServiceOperationResponse *) getResultsFromJsonString:(NSString *)jsonString;
@end
