//
//  PhotoSetModel.h
//  WYNews
//
//  Created by 姚乐 on 16/10/24.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoSetModel : NSObject

@property (nonatomic,copy) NSString *scover;
@property (nonatomic,copy) NSString *setname;
@property (nonatomic,copy) NSString *reporter;
@property (nonatomic,copy) NSString *creator;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *clientadurl;
@property (nonatomic,copy) NSString *neteasecode;
@property (nonatomic,copy) NSString *source;
@property (nonatomic,copy) NSString *postid;
@property (nonatomic,copy) NSString *cover;
@property (nonatomic,copy) NSString *settag;
@property (nonatomic,copy) NSString *commenturl;
@property (nonatomic,strong)NSArray *photos;
@property (nonatomic,copy) NSString *tcover;
@property (nonatomic,copy) NSString *createdate;
@property (nonatomic,copy) NSString *series;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *datatime;
@property (nonatomic,copy) NSString *autoid;
@property (nonatomic,copy) NSString *boardid;

-(instancetype)initWithDict:(NSDictionary*)dict;

+(instancetype)photoSetWithDict:(NSDictionary*)dict;

-(void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end
