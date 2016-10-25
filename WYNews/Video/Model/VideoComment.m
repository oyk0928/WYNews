//
//  VideoComment.m
//  WYNews
//
//  Created by 姚乐 on 16/10/25.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import "VideoComment.h"

@implementation VideoComment

+(instancetype)videoCommentWithDict:(NSDictionary *)dict {
    VideoComment* model = [[self alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    model.ID = dict[@"id"];
    return model;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
