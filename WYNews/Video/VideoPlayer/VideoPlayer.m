//
//  VideoPlayer.m
//  WYNews
//
//  Created by 姚乐 on 16/10/25.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import "VideoPlayer.h"
#import <UIKit/UIKit.h>

@interface VideoPlayer()
@property (weak, nonatomic) IBOutlet UIButton *playPauseBtn;
@property (weak, nonatomic) IBOutlet UIButton *fullScreenBtn;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *progressView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *toolView;

@property (nonatomic,strong)AVPlayer *player;
@property (nonatomic,weak)AVPlayerLayer *playerLayer;

@property (nonatomic,assign)Boolean isShowToolView;
@property (nonatomic,strong)NSTimer *progressTimer;



@end

@implementation VideoPlayer
- (IBAction)playPauseBtn:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        [self.player play];
        [self addProgressTimer];
    } else {
        [self.player pause];
        [self removeProgressTimer];
    }
}
- (IBAction)fullScreenBtn:(UIButton *)sender {
    sender.selected = !sender.selected;
    if ([self.delegate respondsToSelector:@selector(videoplayViewSwitchOrientation:)]) {
        [self.delegate videoplayViewSwitchOrientation:sender.selected];
    }
}
- (IBAction)sliderValueChanged {
}
- (IBAction)startSlider {
}
- (IBAction)slider {
}


-(void)awakeFromNib {
    self.player = [[AVPlayer alloc]init];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    [self.imageView.layer addSublayer:self.playerLayer];
    
    self.toolView.alpha = 0;
    self.isShowToolView = NO;
}

-(void)setPlayerItem:(AVPlayerItem *)playerItem {
    _playerItem = playerItem;
    [self.player replaceCurrentItemWithPlayerItem:playerItem];
    [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [self.player play];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    AVPlayerItem *item = (AVPlayerItem *)object;
    if (item.status == AVPlayerItemStatusReadyToPlay) {
        [self.progressView stopAnimating];
    }
}

- (IBAction)tapAction:(UITapGestureRecognizer *)sender {
    [UIView animateWithDuration:0.5 animations:^{
        if (self.isShowToolView) {
            self.toolView.alpha = 0;
            self.isShowToolView = NO;
        } else {
            self.toolView.alpha = 1;
            self.isShowToolView = YES;
        }
    }];
}

-(void)dealloc {
    [self.playerItem removeObserver:self forKeyPath:@"status" context:nil];
    [self.player replaceCurrentItemWithPlayerItem:nil];
}

-(void)addProgressTimer {
    self.progressTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateInfo) userInfo:nil repeats:YES];
}

-(void)updateInfo {
    NSTimeInterval duration = CMTimeGetSeconds(self.player.currentItem.duration);
    NSTimeInterval current = CMTimeGetSeconds(self.player.currentTime);
    self.timeLabel.text = [NSString stringWithFormat:@"%0.f/%0.f",current,duration];
    self.progressSlider.value = current / duration;
}

-(void)removeProgressTimer {
    [self.progressTimer invalidate];
    self.progressTimer = nil;
}

-(void)suspendPlayVideo {
    [self.progressView stopAnimating];
    
    self.playPauseBtn.selected = NO;
    self.toolView.alpha = 1;
    self.isShowToolView = YES;
    
    [self.player pause];
    
    [self removeProgressTimer];

}

-(void)resetPlayView {
    [self suspendPlayVideo];
    
    [self.playerLayer removeFromSuperlayer];
    // 替换PlayerItem为nil
    [self.player replaceCurrentItemWithPlayerItem:nil];
    // 把player置为nil
    self.player = nil;
    
    [self removeFromSuperview];
    
    
}

- (void)videoplayViewSwitchOrientation:(BOOL)isFull {
    
}



@end
