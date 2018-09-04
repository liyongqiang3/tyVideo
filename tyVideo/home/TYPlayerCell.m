//
//  YYPlayerCell.m
//  tyVideo
//
//  Created by yongqiang li on 2018/9/4.
//  Copyright © 2018 yongqiang li. All rights reserved.
//

#import "TYPlayerCell.h"
#import "TYPlayerView.h"

@interface TYPlayerCell ()

@property (nonatomic) TYPlayerView *playerView;

@end


@implementation TYPlayerCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.playerView = [[TYPlayerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [self.contentView addSubview:self.playerView];
    }
    return self;
}

- (void)curPlayerUrl:(NSString *)url
{

    [self.playerView curPlayerUrl:[NSURL URLWithString:url]];
    [self.playerView  play];
}

@end
