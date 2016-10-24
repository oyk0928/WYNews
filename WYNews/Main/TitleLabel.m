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

-(void)setScale:(CGFloat)scale {
    _scale = scale;
    self.textColor = [UIColor colorWithRed:scale green:0.0 blue:0.0 alpha:1];
    
    CGFloat minScale = 0.7;
    CGFloat trueScale = minScale + (1-minScale)*scale;
    self.transform = CGAffineTransformMakeScale(trueScale, trueScale);
}

@end
