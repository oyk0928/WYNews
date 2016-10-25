//
//  VideoModel.h
//  WYNews
//
//  Created by 姚乐 on 16/10/24.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VideoComment.h"

@interface VideoModel : NSObject

@property (nonatomic,copy)NSNumber *cache_version;
@property (nonatomic,copy) NSString *created_at;
@property (nonatomic,copy) NSString *ID;
@property (nonatomic,copy) NSString *is_gif;
@property (nonatomic,copy) NSString *voicetime;
@property (nonatomic,copy) NSString *image2;
@property (nonatomic,copy) NSString *voicelength;
@property (nonatomic,strong)VideoComment* top_cmt;
@property (nonatomic,copy)NSNumber *playfcount;
@property (nonatomic,copy) NSString *repost;
@property (nonatomic,copy) NSString *bimageuri;
@property (nonatomic,copy) NSString *image1;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *theme_type;
@property (nonatomic,copy) NSString *hate;
@property (nonatomic,copy) NSString *image0;
@property (nonatomic,copy) NSString *comment;
@property (nonatomic,copy) NSString *passtime;
@property (nonatomic,copy) NSString *ding;
@property (nonatomic,copy) NSString *type;
@property (nonatomic,copy)NSNumber *playcount;
@property (nonatomic,copy) NSString *tag;
@property (nonatomic,copy) NSString *cdn_img;
@property (nonatomic,copy) NSString *theme_name;
@property (nonatomic,copy) NSString *create_time;
@property (nonatomic,copy) NSString *favourite;
@property (nonatomic,strong)id themes;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *height;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *videotime;
@property (nonatomic,copy) NSString *bookmark;
@property (nonatomic,copy) NSString *cai;
@property (nonatomic,copy) NSString *screen_name;
@property (nonatomic,copy) NSString *profile_image;
@property (nonatomic,copy) NSString *love;
@property (nonatomic,copy) NSString *user_id;
@property (nonatomic,copy) NSString *theme_id;
@property (nonatomic,copy) NSString *original_pid;
@property (nonatomic,copy)NSNumber *t;
@property (nonatomic,copy) NSString *image_small;
@property (nonatomic,copy) NSString *weixin_url;
@property (nonatomic,copy) NSString *voiceuri;
@property (nonatomic,copy) NSString *videouri;
@property (nonatomic,copy) NSString *width;

+(instancetype)videoModelWithDict:(NSDictionary*)dict;

-(void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end
