//
//  VideoComment.h
//  WYNews
//
//  Created by 姚乐 on 16/10/25.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VideoUser.h"

@interface VideoComment : NSObject

@property (nonatomic, copy) NSString *ID;//评论的标识
@property (nonatomic, copy) NSString *voiceUrl;
/** 音频文件的时长 */
@property (nonatomic, assign) NSInteger voicetime;
/** 评论的文字内容 */
@property (nonatomic, copy) NSString *content;
/** 被点赞的数量 */
@property (nonatomic, assign) NSInteger like_count;
/** 用户 */
@property (nonatomic, strong) VideoUser *user;

+(instancetype)videoCommentWithDict:(NSDictionary *)dict;

-(void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end
