//
//  JsonFeedItem.m
//  PacteraTest
//
//  Created by Farrukh Javeid on 12/21/14.
//
//

#import "JsonFeedItem.h"

@implementation JsonFeedItem
@synthesize title = _title;
@synthesize description = _description;
@synthesize image = _image;

-(id) init {
    if (self = [super init]) {
        
        //var init
        NSString *title = [[NSString alloc] init];
        self.title = title;
        [title release];
        
        NSString *description = [[NSString alloc] init];
        self.description = description;
        [description release];
        
        NSString *image = [[NSString alloc] init];
        self.image = image;
        [image release];
    }

    return self;
}

-(void) dealloc {

    [_title release];
    _title = nil;
    [_description release];
    _description = nil;
    [_image release];
    _image = nil;
    
    [super dealloc];
}

@end
