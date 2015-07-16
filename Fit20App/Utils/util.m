//
//  IMFunctions.m
//  InvoiceManager
//
//  Created by TheAppGuruz-iOS-102 on 5/7/13.
//  Copyright (c) 2013 TheAppGuruz-iOS-102. All rights reserved.
//

#import "util.h"

@implementation util

+ (NSString *) myTrim:(NSString *) string
{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


+ (NSString *) getFilePath:(NSString *) fileName
{
    NSString *docsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [docsDir stringByAppendingPathComponent:fileName];
}

+ (void)copyDatabaseInApplication:(NSString *) dbName
{
    NSString *dbPath = [self getFilePath:dbName];
    if(![FILEMANAGER fileExistsAtPath:dbPath])
    {
        NSString *sourcePath = [[[NSBundle mainBundle] resourcePath]
                                stringByAppendingPathComponent:dbName];
        [FILEMANAGER copyItemAtPath:sourcePath toPath:dbPath error:nil];
    }
}

+ (void)saveFileatPath:(NSString *)filePath withData:(NSData *)fileData
{
    [fileData writeToFile:filePath atomically:YES];
}

+ (void)removeFileatFilePath:(NSString *)filePath
{
    NSError *error = nil;
    [FILEMANAGER removeItemAtPath: filePath error: &error];
}

+ (void)RemoveDirectoryFromLocal:(NSString *)directory
{
    NSError *error = nil;
    [FILEMANAGER removeItemAtPath:directory error:&error];
}

+(BOOL)isEmpty:(id)thing
{
    if (thing == nil)
    {
        return YES;
    }
    else if ([thing isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    else if (thing == (id)[NSNull null])
    {
        return YES;
    }
    else if ([thing isKindOfClass:[NSData class]])
    {
        if ([(NSData *)thing length] == 0)
        {
            return YES;
        }
    }
    else if ([thing isKindOfClass:[NSArray class]])
    {
        if ([(NSArray *)thing copy] == 0)
        {
            return YES;
        }
    }
    else if ([thing isKindOfClass:[NSString class]])
    {
        if ([[(NSString *)thing stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0)
        {
            return YES;
        }
        
        if (thing == (id)[NSNull null]) {
            return YES;
        }
        
        if ([(NSString *)thing isEqualToString:@"<null>"]) {
            return YES;
        }
        
        if ([(NSString *)thing isEqualToString:@"(null)"]) {
            return YES;
        }
    }
    return NO;
}

+ (BOOL) isValidEmail:(NSString *)emailString
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailString];
}

+ (BOOL)date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate
{
    if ([date compare:beginDate] == NSOrderedAscending)
        return NO;
    
    if ([date compare:endDate] == NSOrderedDescending)
        return NO;
   
    return YES;
}

@end
