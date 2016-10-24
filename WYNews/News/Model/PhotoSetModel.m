//
//  PhotoSetModel.m
//  WYNews
//
//  Created by 姚乐 on 16/10/24.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import "PhotoSetModel.h"

@implementation PhotoSetModel

-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self= [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)photoSetWithDict:(NSDictionary *)dict {
    return [[self alloc]initWithDict:dict];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
