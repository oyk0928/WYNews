//
//  NewsModel.h
//  WYNews
//
//  Created by 姚乐 on 16/10/22.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

@property (nonatomic,copy) NSString *url_3w;
@property (nonatomic,copy) NSString *specialID;
@property (nonatomic,copy) NSString *digest;    //描述
@property (nonatomic,copy) NSString *ltitle;
@property (nonatomic,copy) NSString *subtitle;
@property (nonatomic,copy) NSString *imgsrc;    //图片地址
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *postid;
@property (nonatomic,copy) NSString *source;
@property (nonatomic,copy) NSString *skipID;
@property (nonatomic,copy) NSString *title; //标题
@property (nonatomic,copy)NSNumber *votecount;
@property (nonatomic,copy)NSNumber *priority;
@property (nonatomic,copy) NSString *docid; //新闻ID
@property (nonatomic,copy) NSString *lmodify;
@property (nonatomic,copy) NSString *boardid;
@property (nonatomic,copy) NSString *ptime;  //新闻发布时间
@property (nonatomic,copy)NSNumber *replyCount; //回贴评论数
@property (nonatomic,copy) NSString *photosetID;
@property (nonatomic,strong)NSArray *imgextra;  //多图
@property (nonatomic,copy)NSNumber *imgsum;

@property (nonatomic,copy) NSString *tname;
@property (nonatomic,copy)NSNumber *hasHead;
@property (nonatomic,copy)NSNumber *hasImg;
@property (nonatomic,assign)BOOL hasCover;
@property (nonatomic,copy) NSString *cid;
@property (nonatomic,copy)NSNumber *hasAD;
@property (nonatomic,assign)BOOL hasIcon;
@property (nonatomic,strong)NSArray *ads;
@property (nonatomic,copy)NSNumber *order;

@property (nonatomic,copy)NSString *template;
@property (nonatomic,copy)NSString *alias;
@property (nonatomic,copy)NSString *skipType;
@property (nonatomic,copy)NSString *ename;

@property (nonatomic,copy)NSNumber *imgType;
@property (nonatomic,copy) NSString *pixel;
@property (nonatomic,strong)NSArray *wap_portal;


@property (nonatomic,copy)NSNumber *voteCount;
@property (nonatomic,copy)NSString *videoID;
@property (nonatomic,copy)NSDictionary *videoinfo;


@property (nonatomic,strong)NSArray *editor;

@property (nonatomic,copy) NSString *timeConsuming;
@property (nonatomic,copy) NSString *adTitle;


@property (nonatomic,copy) NSString *TAGS;
@property (nonatomic,copy) NSString *TAG;
@property (nonatomic,strong)NSArray *specialextra;


@property (nonatomic,copy) NSString *commentid;
@property (nonatomic,copy)NSNumber *speciallogo;
@property (nonatomic,copy) NSString *specialtip;
@property (nonatomic,copy) NSString *specialadlogo;

@property (nonatomic,strong)NSArray *applist;

@property (nonatomic,copy) NSString *live_info;
@property (nonatomic,copy) NSString *videosource;

@property (nonatomic,copy)NSNumber *length;


-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)newsModelWithDict:(NSDictionary*)dict;

-(void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end
