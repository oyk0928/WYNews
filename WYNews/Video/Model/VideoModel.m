//
//  VideoModel.m
//  WYNews
//
//  Created by 姚乐 on 16/10/24.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel

+(instancetype)videoModelWithDict:(NSDictionary *)dict {
    VideoModel* model = [[self alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    model.ID = dict[@"id"];
    return model;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
