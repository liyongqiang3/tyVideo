//
//  TYBaseTabBarController.h
//  tyVideo
//
//  Created by yongqiang li on 2018/8/24.
//  Copyright © 2018 yongqiang li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYBaseTabBarController : UITabBarController<UITabBarControllerDelegate>
- (UIImage *)makeSelectImage:(NSString *)imgName;

- (UINavigationController *)makeNav:(UIViewController *)vc;

- (void)initHighlightViewWithTabCount:(NSInteger)count;
- (void)setHighlightIndex:(NSInteger)index number:(NSInteger)number;
- (void)hideHighlightView;

@end
