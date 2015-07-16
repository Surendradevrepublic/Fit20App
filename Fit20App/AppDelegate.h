//
//  AppDelegate.h
//  Fit20App
//
//  Created by surendra kunwar on 6/15/15.
//  Copyright (c) 2015 Devrepublic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "util.h"
#import "LoginViewController.h"
#import "Reachability.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    LoginViewController *loginVC;
    
}

@property BOOL isNetworkAvailable;
@property (nonatomic,retain) Reachability *hostReachability,*internetReachability, *wifiReachability;
@property (strong, nonatomic) UIWindow *window;
@property (strong ,nonatomic) UINavigationController *nav;

@end

