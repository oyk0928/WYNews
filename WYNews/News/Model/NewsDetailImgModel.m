//
//  NewsDetailImgModel.m
//  WYNews
//
//  Created by 姚乐 on 16/10/23.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import "NewsDetailImgModel.h"

@implementation NewsDetailImgModel

+ (instancetype)detailImgWithDict:(NSDictionary *)dict
{
    NewsDetailImgModel *imgModel = [[self alloc]init];
    imgModel.ref = dict[@"ref"];
    imgModel.pixel = dict[@"pixel"];
    imgModel.src = dict[@"src"];
    
    return imgModel;
}
@end
