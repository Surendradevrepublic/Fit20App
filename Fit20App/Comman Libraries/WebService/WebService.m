//
//  WebService.m
//  DivorceApp
//
//  Created by Devrepublic on 5/1/14.
//  Copyright (c) 2014 DevRepublic. All rights reserved.
//

#import "WebService.h"

@implementation WebService

+(void)getRequestWithUrl:(NSString *)url WithParameter:(NSDictionary *)dictParams GetResponse:(void (^)(id response))getResponse
{
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSString *getRequest = [NSString stringWithFormat:@"%@%@", BaseUrl, url];

    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",getRequest]]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"Bearer ya29.rwFFPBVkbBXk4dYhcMaU1JBhquDWg5GCKPG-Z3K3tc-t1zxfHsEagz5qcFW1AD5mKl46" forHTTPHeaderField:@"Authorization"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"appliction/json" forHTTPHeaderField:@"Content-Type"];
    
    if(request)
    {
        [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
         
         {
             
             dispatch_async(dispatch_get_main_queue(), ^{
                 
                 if(connectionError)
                     
                 {
                     getResponse(nil);
                     
                 }else if (!data){
                     
                     getResponse(nil);
                     
                 }else{
                     
                     NSError *err = nil;
                     
                     id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&err];
                     
                     if (err) {
                         
                         DisplayAlertWithTitle(@"", @"No response from the server!")
                         
                         getResponse(nil);
                         
                     }else{
                         
                         getResponse(json);
                     }
                 }
             });
         }];
    }
}

+(void)postRequestWithUrl:(NSString *)url WithParameter:(NSDictionary *)dictParams WithImage:(UIImage *)image FileName:(NSString *)strFileName InView:(UIView *)vw GetResponse:(void (^)(id response))getResponse
{
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    
    NSString *postRequest = [NSString stringWithFormat:@"%@%@", BaseUrl, url];
    
    [urlRequest setURL:[NSURL URLWithString:postRequest]];

    [urlRequest setHTTPMethod:@"POST"];
    
    NSString *myboundary = @"*****";
    
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",myboundary];
    
    [urlRequest addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    NSMutableData *postData = [NSMutableData data];
    NSString *str = @"";
    for (NSString *strKey in [dictParams allKeys])
    {
        if (![strKey isEqualToString:[[dictParams allKeys] lastObject]]) {
            str = [NSString stringWithFormat:@"%@%@=%@&", str,strKey, [dictParams valueForKey:strKey]];
        }else{
            str = [NSString stringWithFormat:@"%@%@=%@", str, strKey, [dictParams valueForKey:strKey]];
        }
    }
    [postData appendData:[str dataUsingEncoding:NSUTF8StringEncoding]];
   
    NSData *imageData = UIImageJPEGRepresentation(image, 1.0);

    if (image)
    {
        [postData appendData:[[NSString stringWithString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"upfile\"; filename=\"%@\"\r\n",strFileName]] dataUsingEncoding:NSUTF8StringEncoding]];
        [postData appendData:[[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [postData appendData:[NSData dataWithData:imageData]];

    }
    [urlRequest setHTTPBody:postData];
    [urlRequest setValue:[NSString stringWithFormat:@"%lu",(unsigned long)[postData length]] forHTTPHeaderField:@"Content-Length"];
    
    if(urlRequest)
    {
        [NSURLConnection sendAsynchronousRequest:urlRequest queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
         {
             dispatch_async(dispatch_get_main_queue(), ^{
                 if(connectionError)
                 {
                     getResponse(nil);
                 }else if (!data){
                     getResponse(nil);
                 }else{
                     NSError *err = nil;
                     id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&err];
                    
                     if (err) {
                         DisplayAlertWithTitle(@"", @"No response from the server!");
                         getResponse(nil);
                     }else{
                         getResponse(json);
                     }
                 }
             });
         }];
    }
}

+(void)postRequestForMail:(NSString *)url WithParameter:(NSMutableDictionary *)dictParams GetResponse:(void (^)(id response))getResponse
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSString *requestString = [NSString stringWithFormat:@"%@", url];
    [request setURL:[NSURL URLWithString:requestString]];
    [request setHTTPMethod:@"POST"];
    [request addValue:@"utf-8" forHTTPHeaderField:@"charset"];
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    if (dictParams)
    {
        [request setHTTPBody:[WebService preparePostData:dictParams]];
    }
    NSOperationQueue *operation = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:operation completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         dispatch_async(dispatch_get_main_queue(), ^{
          
             if(connectionError){
                 
                 getResponse(nil);
                 
             }else if(!data){
                 
                 getResponse(nil);
             }else{
                 
                 NSString *text = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
                 
                 if ([text boolValue]) {
                     
                     getResponse(text);
                     
                 }else{
                     
                     getResponse(nil);
                     
                 }
                 
             }
             
         });
     }];
}

+(NSMutableData *)preparePostData:(NSMutableDictionary *)dictData
{
    NSMutableData *body = [NSMutableData data];
    NSString *boundary = @"---------------------------14737809831466499882746641449";
   
    for (NSString *param in dictData)
    {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@\r\n", [dictData objectForKey:param]] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    return body;
}

@end
