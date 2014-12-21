//
//  GetJsonFeedServiceOperationTranslator.m
//  PacteraTest
//
//  Created by Farrukh Javeid on 12/21/14.
//
//

#import "GetJsonFeedServiceOperationTranslator.h"
#import "GetJsonFeedServiceOperationResponse.h"
#import "JsonFeedItem.h"

@implementation GetJsonFeedServiceOperationTranslator
+(GetJsonFeedServiceOperationResponse *) getResultsFromJsonString:(NSString *)jsonString {
    
    GetJsonFeedServiceOperationResponse *responseObject = [[[GetJsonFeedServiceOperationResponse alloc] init] autorelease];
    
    NSDictionary *resultsDictionary = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
    
    //title of the feed
    NSString *titleString = [resultsDictionary objectForKey:@"title"];
    if (titleString == (id)[NSNull null]) {
        responseObject.titleString = [NSString string];
    } else {
        responseObject.titleString = titleString;
    }
    
    //resultsArray
    NSMutableArray *resultsArray = [NSMutableArray array];  //array used to store the objects
    NSArray *feedItemsArray = [resultsDictionary objectForKey:@"rows"];
    for (NSDictionary *itemDictionary in feedItemsArray) {
        
        //feed item allocation
        JsonFeedItem *feedItem = [[JsonFeedItem alloc] init];
        
        //title
        NSString *title = [itemDictionary objectForKey:@"title"];
        if (title == (id)[NSNull null]) {
            feedItem.title = [NSString string];
        } else {
            feedItem.title = title;
        }
        
        //description
        NSString *description = [itemDictionary objectForKey:@"description"];
        if (description == (id)[NSNull null]) {
            feedItem.description = [NSString string];
        } else {
            feedItem.description = description;
        }
        
        NSString *image = [itemDictionary objectForKey:@"imageHref"];
        if (image == (id)[NSNull null]) {
            feedItem.image = [NSString string];
        } else {
            feedItem.image = image;
        }
        
        //adding object to array
        [resultsArray addObject:feedItem];
    }

    return responseObject;
}

@end
