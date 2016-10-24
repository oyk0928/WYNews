//
//  NetworkTool.m
//  WYNews
//
//  Created by 姚乐 on 16/10/22.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import "NetworkTool.h"
#import "NewsModel.h"

@implementation NetworkTool

+(instancetype)sharedTool {
    static NetworkTool* tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[self alloc]init];
    });
    return tool;
}

//@"http://c.m.163.com//nc/article/headline/T1348647853363/0-20.html";
-(void)loadNewsFrom:(NSString *)from withType:(NSString *)type success:(void (^)(NSArray *))success failure:(void (^)(void))failure {
    NSString* url = [NSString stringWithFormat:@"http://c.m.163.com//nc/article/%@/%@-20.html",type,from];
    YaoLog(@"%@",url);
    [self GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary* responseObject) {

        NSArray* tempArr = responseObject[[responseObject.keyEnumerator nextObject]];
        NSMutableArray* dataArr = [NSMutableArray array];
        [tempArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NewsModel* model = [NewsModel newsModelWithDict:obj];
            [dataArr addObject:model];
        }];
        success(dataArr);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        nil;
    }];
}

@end
