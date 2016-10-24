//
//  NewsDetailModel.m
//  WYNews
//
//  Created by 姚乐 on 16/10/23.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import "NewsDetailModel.h"
#import "NewsDetailImgModel.h"

@implementation NewsDetailModel

-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self =[super init]) {
        self.title = dict[@"title"];
        self.ptime = dict[@"ptime"];
        self.body = dict[@"body"];
        self.replyBoard = dict[@"replyBoard"];
        self.replyCount = [dict[@"replyCount"] integerValue];
        
        NSArray *imgArray = dict[@"img"];
        NSMutableArray* tempArr = [NSMutableArray array];
        for (NSDictionary* dict in imgArray) {
            NewsDetailImgModel* imgModel = [NewsDetailImgModel detailImgWithDict:dict];
            [tempArr addObject:imgModel];
        }
        self.img = tempArr;
    }
    return self;
}

+(instancetype)newsDetailModelWithDict:(NSDictionary *)dict {
    return [[self alloc]initWithDict:dict];
}

@end
