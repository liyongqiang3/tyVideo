//
//  TYBaseTabBarController.m
//  tyVideo
//
//  Created by yongqiang li on 2018/8/24.
//  Copyright © 2018 yongqiang li. All rights reserved.
//

#import "TYBaseTabBarController.h"
#import "UIImage+ColorFactory.h"

@interface TYBaseTabBarController ()

@property (nonatomic) NSMutableArray <UIView *> *hilightViews;
@property (nonatomic) NSMutableArray <UILabel *> *hilightTexts;

@end

@implementation TYBaseTabBarController

- (id)init
{
    self = [super init];
    if (self) {
        if (IOS7) {
            self.tabBar.barTintColor = TYColorWhite;//HEXCOLOR(0xe6e6e6);
            self.tabBar.translucent = NO;
        } else {
            self.tabBar.backgroundImage = [UIImage TY_createImageWithColor:TYColorWhite];
        }
        self.delegate = self;
        self.hilightViews = [[NSMutableArray alloc] init];
        self.hilightTexts = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)initHighlightViewWithTabCount:(NSInteger)count
{
    for (UIView *view in self.hilightViews) {
        [view removeFromSuperview];
    }
    
    [self.hilightViews removeAllObjects];
    [self.hilightTexts removeAllObjects];
    for (NSInteger i = 0; i < count; i++) {
        UIView *view = [self hilightViewWithIndex:i totalCount:count];
        [self.tabBar addSubview:view];
        view.hidden = YES;
    }
}

- (void)hideHighlightView
{
    for (UIView *view in self.hilightViews) {
        [view removeFromSuperview];
    }
    
    [self.hilightViews enumerateObjectsUsingBlock:^(UIView *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        obj.hidden = YES;
    }];
}

- (UIView *)hilightViewWithIndex:(NSInteger)index totalCount:(NSInteger)total
{
    CGFloat offsetX = floor(SCREEN_WIDTH / total) * 0.5 + 12;
    if (index > 0) {
        offsetX += index * floor(SCREEN_WIDTH / total);
    }
    CGFloat offsetY = 2;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(offsetX, offsetY, 16, 16)];
    view.backgroundColor = [UIColor redColor];
    view.layer.cornerRadius = 8.0f;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.font = BoldFont(12);
    [view addSubview:label];
    [self.hilightViews addObject:view];
    [self.hilightTexts addObject:label];
    return view;
}

- (void)setHighlightIndex:(NSInteger)index number:(NSInteger)number
{
    if (number > 0 && self.hilightViews.count > index && self.hilightTexts.count > index) {
        self.hilightViews[index].hidden = NO;
        if (number < 10) {
            self.hilightTexts[index].text = [@(number)stringValue];
            self.hilightTexts[index].font = BoldFont(12);
        } else if (number < 99) {
            self.hilightTexts[index].text = [@(number)stringValue];
            self.hilightTexts[index].font = BoldFont(10);
        } else {
            self.hilightTexts[index].text = [NSString stringWithFormat:@"99+"];
            self.hilightTexts[index].font = Font(8);
        }
    } else if (self.hilightViews.count > index) {
        self.hilightViews[index].hidden = YES;
    }
}

- (UINavigationController *)makeNav:(UIViewController *)vc
{
    vc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -4);
    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(-4, 0, 4, 0);
    
    [vc.tabBarItem setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      TYColorBlue, NSForegroundColorAttributeName, nil]
                                 forState:UIControlStateSelected];
    [vc.tabBarItem setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      TYColor666, NSForegroundColorAttributeName, nil]
                                 forState:UIControlStateNormal];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    UINavigationBar *navBar = nav.navigationBar;
    [navBar setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar"] forBarMetrics:UIBarMetricsDefault];
    
    NSDictionary *dict = @{NSForegroundColorAttributeName : HEXCOLOR(0x333333)};
    navBar.titleTextAttributes = dict;
    return nav;
}

- (UIImage *)makeSelectImage:(NSString *)imgName
{
    UIImage *image = [UIImage imageNamed:imgName];
    if (IOS7) {
        image =
        [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return image;
}

#pragma mark ----- UITabBarControllerDelegate
// 修复重复点击tab，闪动现象
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if (tabBarController.selectedIndex == [self.viewControllers indexOfObject:viewController]) {
        return NO;
    }
    return YES;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
//{
//    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
//}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)dealloc
{
    self.delegate = nil;
}


@end
