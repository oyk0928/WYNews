//
//  VideoPlayer.h
//  WYNews
//
//  Created by 姚乐 on 16/10/25.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol VideoPlayerDelegate <NSObject>

- (void)videoplayViewSwitchOrientation:(BOOL)isFull;

@end

@interface VideoPlayer : UIView



@property (nonatomic,strong)AVPlayerItem *playerItem;

@property (weak, nonatomic) id<VideoPlayerDelegate> delegate;


-(void)suspendPlayVideo;
-(void)resetPlayView;

@end
