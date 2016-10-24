//
//  NetworkTool.h
//  WYNews
//
//  Created by 姚乐 on 16/10/22.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>


@interface NetworkTool : AFHTTPSessionManager

+(instancetype)sharedTool;

-(void)loadNewsFrom:(NSString*)from withType:(NSString*)type success:(void(^)(NSArray* modelArr))success failure:(void(^)(void))failure;

@end
