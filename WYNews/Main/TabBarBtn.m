//
//  TabBarBtn.m
//  WYNews
//
//  Created by 姚乐 on 16/10/21.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import "TabBarBtn.h"

@implementation TabBarBtn

-(instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake((self.bounds.size.width - 25) / 2, 5, 25, 25);
    
    CGRect titleF = self.titleLabel.frame;
    titleF.origin.x = (self.bounds.size.width - titleF.size.width) / 2;
    titleF.origin.y = CGRectGetMaxY(self.imageView.frame) + 2;
    self.titleLabel.frame = titleF;
    self.titleLabel.font = [UIFont systemFontOfSize:10];
}

@end
