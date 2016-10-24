//
//  PhotoModel.h
//  WYNews
//
//  Created by 姚乐 on 16/10/24.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoModel : NSObject

@property (nonatomic,copy) NSString *imgurl;
@property (nonatomic,copy) NSString *note;
@property (nonatomic,copy) NSString *photoid;
@property (nonatomic,copy) NSString *timgurl;
@property (nonatomic,copy) NSString *simgurl;
@property (nonatomic,copy) NSString *imgtitle;
@property (nonatomic,copy) NSString *photohtml;
@property (nonatomic,copy) NSString *squareimgurl;
@property (nonatomic,copy) NSString *cimgurl;

-(instancetype)initWithDict:(NSDictionary*)dict;

+(instancetype)photoWithDict:(NSDictionary*)dict;
@end
