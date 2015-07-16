//
//  AppDelegate.m
//  Fit20App
//
//  Created by surendra kunwar on 6/15/15.
//  Copyright (c) 2015 Devrepublic. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize nav,isNetworkAvailable;
@synthesize internetReachability,wifiReachability,hostReachability;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    internetReachability = [Reachability reachabilityForInternetConnection];
    [internetReachability startNotifier];
    [self UpdateNetwork:internetReachability];
    
    loginVC = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    
    HomeViewController*  homeVC = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    
    nav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    [nav setNavigationBarHidden:YES];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    if (isNetworkAvailable)
    {
        NSLog(@"123");
    }
    else
    {
        DisplayAlertWithTitle(@"", @"No Internet Connection!");
    }
    
    return YES;
}

- (void)reachabilityChanged:(NSNotification *)note
{
    Reachability* curReach = [Reachability reachabilityForInternetConnection];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self UpdateNetwork:curReach];
}

- (void)UpdateNetwork:(Reachability *)reachability
{
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    BOOL connectionRequired = [reachability connectionRequired];
    NSString* statusString = @"";
    
    switch (netStatus)
    {
        case NotReachable:        {
            statusString = NSLocalizedString(@"Access Not Available", @"Text field text for access is not available");
            isNetworkAvailable=NO;
            connectionRequired = NO;
            break;
        }
        case ReachableViaWWAN:        {
            statusString = NSLocalizedString(@"Reachable WWAN", @"");
            isNetworkAvailable =YES;
            break;
        }
        case ReachableViaWiFi:        {
            statusString= NSLocalizedString(@"Reachable WiFi", @"");
            isNetworkAvailable =YES;
            break;
        }
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
