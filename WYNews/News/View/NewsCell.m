//
//  NewsCell.m
//  WYNews
//
//  Created by 姚乐 on 16/10/21.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import "NewsCell.h"


@interface NewsCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageIcon2;
@property (weak, nonatomic) IBOutlet UIImageView *imageIcon3;

@end

@implementation NewsCell

-(void)setModel:(NewsModel *)model {
    _model = model;
    self.titleLabel.text = model.title;
    self.subtitleLabel.text = model.source;
    [self.titleLabel sizeToFit];
    [self.subtitleLabel sizeToFit];
    
    CGFloat count = [model.replyCount intValue];
    if(count<10000) {
        self.replyLabel.text = [NSString stringWithFormat:@"%0.f跟帖",count];
    } else {
        count = count /10000;
        self.replyLabel.text = [NSString stringWithFormat:@"%.2f万跟帖",count];
    }
    [self.replyLabel sizeToFit];
    
    NSURL* url = [NSURL URLWithString:model.imgsrc];
    [self.imageIcon sd_setImageWithURL:url];
    
    if (model.imgextra.count == 2) {
        NSURL* url2 = [NSURL URLWithString:model.imgextra[0][@"imgsrc"]];
        NSURL* url3 = [NSURL URLWithString:model.imgextra[1][@"imgsrc"]];
        [self.imageIcon2 sd_setImageWithURL:url2];
        [self.imageIcon3 sd_setImageWithURL:url3];
    }
}

@end
