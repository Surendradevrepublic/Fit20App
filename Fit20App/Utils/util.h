//
//  IMFunctions.h
//  InvoiceManager
//
//  Created by TheAppGuruz-iOS-102 on 5/7/13.
//  Copyright (c) 2013 TheAppGuruz-iOS-102. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define IS_DEVICE_iPHONE_4 ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) && ([[UIScreen mainScreen ] bounds].size.height<568.0f))

#define IS_DEVICE_iPHONE_5 ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) && ([[UIScreen mainScreen ] bounds].size.height==568.0f))

#define IS_DEVICE_iPHONE_6 ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) && ([[UIScreen mainScreen ] bounds].size.height>568.0f) && ([[UIScreen mainScreen ] bounds].size.height<720.0f))

#define IS_DEVICE_iPHONE_6Plus ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) && ([[UIScreen mainScreen ] bounds].size.height>720.0f))

#define IS_IPHONE (BOOL)UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone

#define IS_DEVICE_iPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define DocumentPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]

#define DisplayAlertWithTitle(title,msg){UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]; [alertView show]; }

#define appDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#define UserDefaults [NSUserDefaults standardUserDefaults]

#define FILEMANAGER [NSFileManager defaultManager]

#define storyboard [UIStoryboard storyboardWithName:@"Main" bundle:nil]

#define DocumentPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]

#define APPNAME @"FIT20 App"

#define BaseUrl @"https://20150626-0005-dot-fit20app-4.appspot.com/"

#define ERROR_CODE_101 @"Invalid User Id and password combination"
#define ERROR_CODE_102 @"Required arguments are missing"
#define ERROR_CODE_103 @"Invalid User"
#define ERROR_CODE_104 @"Data Type mismatch"
#define ERROR_CODE_10 @"Data updated successfully"
#define ERROR_CODE_106 @"Invalid argument"
#define ERROR_CODE_107 @"No data available"
#define ERROR_CODE_108 @"E-mail address is not known"
#define ERROR_CODE_109 @"E-mail address is already in use"
#define ERROR_CODE_201 @"Please check your emails for password reset"
#define ERROR_CODE_202 @"Data Inserted successfully"
#define ERROR_CODE_203 @"Data updated successfully"


@interface util : NSObject

+ (BOOL) isDeviceLandscape;
+ (BOOL)isEmpty:(id)thing;
+ (NSString *) myTrim:(NSString *) string;
+ (void) copyDatabaseInApplication:(NSString *) dbName;
+ (void) saveFileatPath:(NSString *)filePath withData:(NSData *)fileData;
+ (void) removeFileatFilePath:(NSString *)filePath;
+ (void) RemoveDirectoryFromLocal:(NSString *)directory;
+ (NSString *) getFilePath:(NSString *) fileName;
+ (BOOL) isValidEmail:(NSString *) emailString;
+ (BOOL) date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate;
+ (float)textLabelfontSize;
+ (float)detailTextLabelfontSize;

@end
