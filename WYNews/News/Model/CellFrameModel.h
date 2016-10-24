//
//  CellFrameModel.h
//  WYNews
//
//  Created by 姚乐 on 16/10/22.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsModel.h"

@interface CellFrameModel : NSObject

/*
 保存数据
 */
@property (nonatomic,strong)NewsModel* model;

/*
 保存cell的frame信息
 */
@property (nonatomic,copy)NSString *identifier;
@property (nonatomic,assign)CGFloat cellHeight;


@end
