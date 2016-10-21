//
//  YAOTabBar.m
//  WYNews
//
//  Created by 姚乐 on 16/10/21.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import "YAOTabBar.h"
#import "TabBarBtn.h"

@interface YAOTabBar()
@property (nonatomic,strong)TabBarBtn* selBtn;


@end


@implementation YAOTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)init {
    if (self = [super init]) {
        [self setupBtn];
    }
    return self;
}

-(void)setupBtn {
    [self addBarBtnName:@"tabbar_icon_news_normal" withDisPicName:@"tabbar_icon_news_highlight" withTitle:@"新闻"];
    [self addBarBtnName:@"tabbar_icon_media_normal" withDisPicName:@"tabbar_icon_media_highlight" withTitle:@"直播"];
    [self addBarBtnName:@"tabbar_icon_reader_normal" withDisPicName:@"tabbar_icon_reader_highlight" withTitle:@"话题"];
    [self addBarBtnName:@"tabbar_icon_me_normal" withDisPicName:@"tabbar_icon_me_highlight" withTitle:@"我"];
    
}

-(void)addBarBtnName:(NSString*)name withDisPicName:(NSString*)dis withTitle:(NSString*)title {
    TabBarBtn *btn = [[TabBarBtn alloc]init];

    [btn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:dis] forState:UIControlStateDisabled];
    [btn setTitle:title forState:UIControlStateNormal];

    [btn setTitleColor:[UIColor colorWithRed:149/255.0 green:149/255.0 blue:149/255.0 alpha:1] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:183/255.0 green:20/255.0 blue:28/255.0 alpha:1] forState:UIControlStateDisabled];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    if (self.subviews.count == 1) {
        btn.enabled = NO;
        _selBtn = btn;
    }
}

-(void)btnClick:(TabBarBtn*)btn {
    _selBtn.enabled = YES;
    btn.enabled = NO;
    _selBtn = btn;
    
}

-(void)layoutSubviews {
    NSInteger count = self.subviews.count;
    CGFloat width = self.bounds.size.width  / count;
    CGFloat height = self.bounds.size.height;
    for (int i = 0; i < count; i++) {
        UIButton* btn = self.subviews[i];
        btn.frame = CGRectMake(i * width, 0, width, height);
        btn.tag = i+1;
    }
}

@end
