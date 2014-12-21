//
//  GenericService.m
//  Scenes
//
//  Created by developer on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GenericService.h"

@implementation GenericService
@synthesize theOperationQueue = _theOperationQueue;


- (NSOperationQueue *)retrieverOperationQueue {
	if(nil == self.theOperationQueue) {
		// lazy creation of the queue for retrieving the earthquake data
		NSOperationQueue* queue = [[NSOperationQueue alloc] init];
        self.theOperationQueue=queue;
        [ self.theOperationQueue addObserver:self forKeyPath:@"operations" options:0 context:NULL];
        [queue release];
        self.theOperationQueue.maxConcurrentOperationCount = 1;
	}
	return self.theOperationQueue;
}


- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object 
                         change:(NSDictionary *)change context:(void *)context
{
    if (object == self.theOperationQueue && [keyPath isEqualToString:@"operations"]) {
        if ([self.theOperationQueue.operations count] == 0) {
            // Do something here when your queue has completed
            NSLog(@"queue has completed");
            
        }
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object 
                               change:change context:context];
    }
}


-(void) dealloc
{
    [self.theOperationQueue removeObserver:self forKeyPath:@"operations" context:NULL];
    [self.theOperationQueue cancelAllOperations];
    
    [_theOperationQueue release];
    _theOperationQueue=nil;

    [super dealloc];
}

@end
