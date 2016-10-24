//
//  NewsDetailImgModel.h
//  WYNews
//
//  Created by 姚乐 on 16/10/23.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsDetailImgModel : NSObject

@property (nonatomic, copy) NSString *src;
/** 图片尺寸 */
@property (nonatomic, copy) NSString *pixel;
/** 图片所处的位置 */
@property (nonatomic, copy) NSString *ref;

+ (instancetype)detailImgWithDict:(NSDictionary *)dict;


@end
