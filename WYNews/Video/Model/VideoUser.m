//
//  VideoUser.m
//  WYNews
//
//  Created by 姚乐 on 16/10/25.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import "VideoUser.h"

@implementation VideoUser

+(instancetype)videoUserWithDict:(NSDictionary *)dict{
    VideoUser* model = [[self alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
