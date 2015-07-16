//
//  WebService.h
//  DivorceApp
//
//  Created by Devrepublic on 5/1/14.
//  Copyright (c) 2014 DevRepublic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebService : NSObject

+(void)getRequestWithUrl:(NSString *)url WithParameter:(NSDictionary *)dictParams GetResponse:(void (^)(id response))getResponse;

+(void)postRequestWithUrl:(NSString *)url WithParameter:(NSDictionary *)dictParams WithImage:(UIImage *)image FileName:(NSString *)strFileName InView:(UIView *)vw GetResponse:(void (^)(id response))getResponse;

+(void)postRequestForMail:(NSString *)url WithParameter:(NSMutableDictionary *)dictParams GetResponse:(void (^)(id response))getResponse;

@end

