//
//  TYPlayerView.m
//  tyVideo
//
//  Created by yongqiang li on 2018/9/4.
//  Copyright © 2018 yongqiang li. All rights reserved.
//

#import "TYPlayerView.h"
#import <AVFoundation/AVPlayer.h>
#import <AVFoundation/AVPlayerLayer.h>
#import <AVFoundation/AVPlayerItem.h>


@interface TYPlayerView ()

@property (strong, nonatomic)AVPlayer *myPlayer;//播放器
@property (strong, nonatomic)AVPlayerItem *playerItem;//播放单元
@property (strong, nonatomic)AVPlayerLayer *playerLayer;//播放界面（layer）
@property (strong, nonatomic)UISlider *avSlider;//用来现实视频的播放进度，并且通过它来控制视频的快进快退。
@property (assign, nonatomic)BOOL isReadToPlay;//
@property (strong, nonatomic)UIButton *playButton;//


@end

@implementation TYPlayerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self avPlayerMethod];
        self.backgroundColor = TYColorWhite;
    }
    return self;
}

- (AVPlayer *)myPlayer
{
    if (!_myPlayer) {
        _myPlayer = [AVPlayer playerWithPlayerItem:self.playerItem];
    }
    return _myPlayer;
}

- (UIButton *)playButton
{
    if (!_playButton) {
        _playButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
        _playButton.backgroundColor = [UIColor redColor];
        [_playButton setTitle:@"按钮" forState:UIControlStateNormal];
        [_playButton addTarget:self action:@selector(playAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_playButton];
    }
    return _playButton;
}

- (void)curPlayerUrl:(NSURL *)url
{
    if (url) {
        //构建播放单元
        self.playerItem = [AVPlayerItem playerItemWithURL:url];
    } else {
        //构建播放网址
        NSURL *videoUrl = [[NSBundle mainBundle]URLForResource:@"test2" withExtension:@"mp4"];
//        NSURL *mediaURL = [NSURL URLWithString:@"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4"];
        //构建播放单元
        self.playerItem = [AVPlayerItem playerItemWithURL:videoUrl];
    }
    [self avPlayerMethod];
}

-(void)avPlayerMethod
{
    //构建播放网址
//    NSURL *mediaURL = [NSURL URLWithString:@"http://baobab.wdjcdn.com/1455782903700jy.mp4"];
//    //构建播放单元
//    self.playerItem = [AVPlayerItem playerItemWithURL:mediaURL];
    //构建播放器对象
    //构建播放器的layer
    self.myPlayer =  [[AVPlayer alloc] initWithPlayerItem:self.playerItem];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.myPlayer];
    self.playerLayer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    [self.layer addSublayer:self.playerLayer];
    self.playerLayer.backgroundColor = TYColor333.CGColor;
    //通过KVO来观察status属性的变化，来获得播放之前的错误信息
    [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
//    if (self.playButton) {
//
//    }
}



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:
(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"status"]) {
        //取出status的新值
        AVPlayerItemStatus status = [change[NSKeyValueChangeNewKey]intValue];
        switch (status) {
            case AVPlayerItemStatusFailed:
                NSLog(@"item 有误");
                self.isReadToPlay = NO;
                break;
            case AVPlayerItemStatusReadyToPlay:
                NSLog(@"准好播放了");
                self.isReadToPlay = YES;
                self.avSlider.maximumValue = self.playerItem.duration.value / self.playerItem.duration.timescale;
                break;
            case AVPlayerItemStatusUnknown:
                NSLog(@"视频资源出现未知错误");
                self.isReadToPlay = NO;
                break;
            default:
                break;
        }
    }
    //移除监听（观察者）
}

- (void)play
{
    if ( self.isReadToPlay) {
        [self.myPlayer play];
    }else{
        NSLog(@"视频正在加载中");
    }
   
}

- (void)pause
{
    [self.myPlayer pause];
}

- (void)playAction
{
//    if ( self.isReadToPlay) {
        [self.myPlayer play];
//    }else{
//        NSLog(@"视频正在加载中");
//    }
}

- (void)dealloc
{
//    [object removeObserver:self forKeyPath:@"status"];

}


@end
