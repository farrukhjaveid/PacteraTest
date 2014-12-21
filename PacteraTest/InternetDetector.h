//
//  DataManager.h
//  GoogleAppEngineLogin
//
//  Created by developer on 5/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface InternetDetector : NSObject {
        
    Reachability* internetReachable;
    Reachability* hostReachable;
    BOOL internetActive;
    BOOL hostActive;
    
}

@property(nonatomic, readwrite) BOOL internetActive;
@property(nonatomic, readwrite) BOOL hostActive;

+ (InternetDetector *) sharedManager;

-(void) startNetworkDetection;

+ (BOOL) isNetAvailable;

@end
