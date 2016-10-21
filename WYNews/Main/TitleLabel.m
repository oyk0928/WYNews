//
//  TitleLabel.m
//  WYNews
//
//  Created by 姚乐 on 16/10/21.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import "TitleLabel.h"

@implementation TitleLabel


-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI {
    
//    self.backgroundColor = [UIColor redColor];
    self.textAlignment = NSTextAlignmentCenter;
}



@end
