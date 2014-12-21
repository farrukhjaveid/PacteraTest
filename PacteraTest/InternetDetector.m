//
//  DataManager.m
//  GoogleAppEngineLogin
//
//  Created by developer on 5/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InternetDetector.h"
#import "Reachability.h"

@interface InternetDetector ()
@end


static InternetDetector *sharedManager = nil;

@implementation InternetDetector
@synthesize internetActive;
@synthesize hostActive;


+ (InternetDetector *) sharedManager
{
	@synchronized(self)
    {
        if (sharedManager == nil){
			sharedManager = [[InternetDetector alloc] init];
            
            
            [sharedManager startNetworkDetection];
            
		}
    }
    return sharedManager;
	
}


-(void) startNetworkDetection
{
    // check for internet connection
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkNetworkStatus:) name:kReachabilityChangedNotification object:nil];
    
    internetReachable = [Reachability reachabilityForInternetConnection];
    [internetReachable startNotifier];
    
    // check if a pathway to a random host exists
    hostReachable = [Reachability reachabilityWithHostName:@"http://google.com/"];
    [hostReachable startNotifier];
    NSLog(@"Detection Started!");
}

- (void) checkNetworkStatus:(NSNotification *)notice
{
    // called after network status changes

    NetworkStatus internetStatus = [internetReachable currentReachabilityStatus];
    switch (internetStatus)
    
    {
        case NotReachable:
        {
            NSLog(@"The internet is down.");
            self.internetActive = NO;
            
            break;
            
        }
        case ReachableViaWiFi:
        {
            NSLog(@"The internet is working via WIFI.");
            self.internetActive = YES;
            break;
            
        }
        case ReachableViaWWAN:
        {
            NSLog(@"The internet is working via WWAN.");
            self.internetActive = YES;

            break;
            
        }
    }
    
    NetworkStatus hostStatus = [hostReachable currentReachabilityStatus];
    switch (hostStatus)
    
    {
        case NotReachable:
        {
            NSLog(@"A gateway to the host server is down.");
            self.hostActive = NO;
            
            break;
            
        }
        case ReachableViaWiFi:
        {
            NSLog(@"A gateway to the host server is working via WIFI.");
            self.hostActive = YES;

            break;
            
        }
        case ReachableViaWWAN:
        {
            NSLog(@"A gateway to the host server is working via WWAN.");
            self.hostActive = YES;

            break;
            
        }
    }
}


+ (BOOL) isNetAvailable
{
    return [[InternetDetector sharedManager] internetActive];
}

@end
