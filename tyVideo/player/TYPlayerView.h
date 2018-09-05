//
//  TYPlayerView.h
//  tyVideo
//
//  Created by yongqiang li on 2018/9/4.
//  Copyright © 2018 yongqiang li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYPlayerView : UIView

- (void)curPlayerUrl:(NSURL *)url;

- (void)play;
- (void)pause;

@end
