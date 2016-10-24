//
//  NewsDetailModel.h
//  WYNews
//
//  Created by 姚乐 on 16/10/23.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsDetailModel : NSObject

@property (nonatomic,copy) NSString *ptime;
@property (nonatomic,copy) NSString *source;
@property (nonatomic,copy) NSString *ec;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *tid;
@property (nonatomic,strong)NSArray *img;
@property (nonatomic,strong)NSArray *topiclist_news;
@property (nonatomic,copy) NSString *docid;
@property (nonatomic,assign)BOOL picnews;
@property(nonatomic,assign)NSInteger replyCount;
@property (nonatomic,copy) NSString *replyBoard;
@property (nonatomic,assign)BOOL hasNext;
@property (nonatomic,copy) NSString *body;
@property (nonatomic,copy)NSNumber *threadAgainst;
@property (nonatomic,copy) NSString *dkeys;
@property (nonatomic,copy) NSString *shareLink;
@property (nonatomic,copy)NSNumber *threadVote;
@property (nonatomic,copy) NSString *digest;

-(instancetype)initWithDict:(NSDictionary*)dict;

+(instancetype)newsDetailModelWithDict:(NSDictionary*)dict;

@end
