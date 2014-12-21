//
//  GenericService.h
//  Scenes
//
//  Created by developer on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GenericService : NSObject

@property (nonatomic, retain) NSOperationQueue *theOperationQueue;

- (NSOperationQueue *)retrieverOperationQueue;

@end
