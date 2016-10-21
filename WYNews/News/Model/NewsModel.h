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
@property (nonatomic,copy) NSString *digest;
@property (nonatomic,copy) NSString *ltitle;
@property (nonatomic,copy) NSString *subtitle;
@property (nonatomic,copy) NSString *imgsrc;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *postid;
@property (nonatomic,copy) NSString *source;
@property (nonatomic,copy) NSString *skipID;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy)NSNumber *votecount;
@property (nonatomic,copy)NSNumber *priority;
@property (nonatomic,copy) NSString *docid;
@property (nonatomic,copy) NSString *lmodify;
@property (nonatomic,copy) NSString *boardid;
@property (nonatomic,copy) NSString *ptime;
@property (nonatomic,copy)NSNumber *replyCount;
@property (nonatomic,copy) NSString *photosetID;
@property (nonatomic,strong)NSArray *imgextra;
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

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)newsModelWithDict:(NSDictionary*)dict;

@end
