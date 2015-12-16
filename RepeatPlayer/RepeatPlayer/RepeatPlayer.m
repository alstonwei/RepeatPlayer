//
//  RepeatPlayer.m
//  ReatPlayerDemo
//
//  Created by Shouqiang Wei on 15/12/16.
//  Copyright © 2015年 教练助理. All rights reserved.
//

#import "RepeatPlayer.h"

#import <AVFoundation/AVFoundation.h>

@interface RepeatPlayer()

@property (nonatomic,strong) AVPlayer *player;
@property (nonatomic,strong) AVPlayerLayer *playerLayer;
@end

@implementation RepeatPlayer

- (BOOL)autoPlay{
    return  YES;
}

-(instancetype)initWithSrc:(NSURL*)src{
    if (self = [super init]) {
        AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:src];
        [playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
        
        self.player = [AVPlayer playerWithPlayerItem:playerItem];
        self.player.volume = self.playerVolume;
        
        self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        [self.player.currentItem addObserver:self forKeyPath:AVPlayerItemDidPlayToEndTimeNotification options:NSKeyValueObservingOptionNew context:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayDidEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
    }
    return self;
}

+(instancetype)showInView:(UIView*) containerView src:(NSURL*) src{
    RepeatPlayer *repeatPlayer = [[RepeatPlayer alloc] initWithSrc:src];
    [repeatPlayer showInView:containerView];
    return repeatPlayer;
}

-(void)showInView:(UIView*) containerView
{
    self.playerLayer.frame = containerView.layer.bounds;
    [containerView.layer addSublayer:self.playerLayer];
    if(self.autoPlay)
    {
        [self.player play];
    }
}

-(void)play
{
    [self.player play];
}

-(void)pause
{
    [self.player pause];
}
//播放结束，自动循环播放。
- (void)moviePlayDidEnd:(NSNotification*)notification{
    
    AVPlayerItem *item = [notification object];
    [item seekToTime:kCMTimeZero];
    [self.player play];
}

#pragma mark - observer of player
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
