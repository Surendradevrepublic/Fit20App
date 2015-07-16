//
//  LoginViewController.h
//  Fit20App
//
//  Created by surendra kunwar on 6/15/15.
//  Copyright (c) 2015 Devrepublic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "HomeViewController.h"


@interface LoginViewController : UIViewController <UITextFieldDelegate,MBProgressHUDDelegate>
{
    MBProgressHUD *hud;
    HomeViewController *homeVC;
}

@property (nonatomic, retain) IBOutlet UITextField *txtEmailId, *txtPassword;
@property (nonatomic, retain) IBOutlet UIButton *btnLogin;

@end
