//
//  LoginViewController.m
//  Fit20App
//
//  Created by surendra kunwar on 6/15/15.
//  Copyright (c) 2015 Devrepublic. All rights reserved.
//

#import "LoginViewController.h"
#import "GTMOAuth2Authentication.h"
#import "GTMOAuth2ViewControllerTouch.h"

@implementation LoginViewController
@synthesize txtEmailId, txtPassword, btnLogin;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self signInToGoogle];
}

-(IBAction)btnLoginClicked:(id)sender
{
//    if ([util isEmpty:txtEmailId.text]) {
//        DisplayAlertWithTitle(APPNAME, @"Please enter Email id!")
//    }else if ([util isEmpty:txtPassword.text]){
//        DisplayAlertWithTitle(APPNAME, @"Please enter Password!")
//    }else if (![util isValidEmail:txtEmailId.text]){
//        DisplayAlertWithTitle(APPNAME, @"Please enter valid Email id!")
//    }else{
        [self checkUserLogin];
//    }
}

-(void)checkUserLogin
{
    [txtEmailId resignFirstResponder];
    [txtPassword resignFirstResponder];
    
    MBProgressHUD *HUD=[[MBProgressHUD alloc]initWithView:self.view];
    HUD.labelText=@"";
    HUD.mode = MBProgressHUDModeAnnularDeterminate;
    [self.view addSubview:HUD];
    HUD.delegate = self;
    [HUD showWhileExecuting:@selector(loadingStart) onTarget:self withObject:nil animated:YES];
}

-(void) loadingStart {
    @try {
        homeVC = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
        [self.navigationController pushViewController:homeVC animated:YES];
        [hud hide:YES];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Creat your Google APP here: https://code.google.com/apis/console/ and get the key and secret

#define GoogleClientID    @"375749707461-oupg0vbv7ooe9ld2neod4qt313pb35va.apps.googleusercontent.com"
#define GoogleClientSecret @"nZ6QVkS5L-SJ6K1kHx9mLIi2"
#define GoogleAuthURL   @"https://accounts.google.com/o/oauth2/auth"
#define GoogleTokenURL  @"https://accounts.google.com/o/oauth2/token"


- (GTMOAuth2Authentication * )authForGoogle
{
    //This URL is defined by the individual 3rd party APIs, be sure to read their documentation
    
    NSURL * tokenURL = [NSURL URLWithString:GoogleTokenURL];
    // We'll make up an arbitrary redirectURI.  The controller will watch for
    // the server to redirect the web view to this URI, but this URI will not be
    // loaded, so it need not be for any actual web page. This needs to match the URI set as the
    // redirect URI when configuring the app with Instagram.
    NSString * redirectURI = @"urn:ietf:wg:oauth:2.0:oob";
    GTMOAuth2Authentication * auth;
    
    auth = [GTMOAuth2Authentication authenticationWithServiceProvider:@"lifebeat"
                                                             tokenURL:tokenURL
                                                          redirectURI:redirectURI
                                                             clientID:GoogleClientID
                                                         clientSecret:GoogleClientSecret];
    auth.scope = @"https://www.googleapis.com/auth/userinfo.profile";
    return auth;
}


- (void)signInToGoogle
{
    GTMOAuth2Authentication * auth = [self authForGoogle];
    
    // Display the authentication view
    GTMOAuth2ViewControllerTouch * viewController = [[GTMOAuth2ViewControllerTouch alloc] initWithAuthentication:auth
                                                                                                authorizationURL:[NSURL URLWithString:GoogleAuthURL]
                                                                                                keychainItemName:@"GoogleKeychainName"
                                                                                                        delegate:self
                                                                                                finishedSelector:@selector(viewController:finishedWithAuth:error:)];
    [self.navigationController pushViewController:viewController animated:YES];
}


- (void)viewController:(GTMOAuth2ViewControllerTouch * )viewController
      finishedWithAuth:(GTMOAuth2Authentication * )auth
                 error:(NSError * )error
{
    NSLog(@"finished");
    NSLog(@"auth access token: %@", auth.accessToken);
    
    [self.navigationController popToViewController:self animated:NO];
    if (error != nil) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error Authorizing with Google"
                                                         message:[error localizedDescription]
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        [alert show];
    } else {
        
        homeVC = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
        [self.navigationController pushViewController:homeVC animated:YES];
    }
}
@end
