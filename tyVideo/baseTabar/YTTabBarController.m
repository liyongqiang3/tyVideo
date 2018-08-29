//
//  YTTabBarController.m
//  tyVideo
//
//  Created by yongqiang li on 2018/8/27.
//  Copyright © 2018 yongqiang li. All rights reserved.
//

#import "YTTabBarController.h"
#import "TYHomeViewController.h"
#import "TYMineViewController.h"
#import "TYLoveViewController.h"
#import "TYQuestionViewController.h"

@interface YTTabBarController ()

@property (nonatomic, strong) UINavigationController *homeNav;
@property (nonatomic, strong) UINavigationController *questionNav;
@property (nonatomic, strong) UINavigationController *loveNav;
@property (nonatomic, strong) UINavigationController *mineNav;

@end

@implementation YTTabBarController

- (id)init
{
    self = [super init];
    if (self) {
        [self initControllerArray];
    }
    return self;
}

- (void)initControllerArray
{
    NSInteger tagIdx = 0;
    TYHomeViewController *homeVC = [[TYHomeViewController alloc] init];
    homeVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:nil tag:tagIdx++];
    self.homeNav = [self makeNav:homeVC];
    
    TYQuestionViewController *questionVC = [[TYQuestionViewController alloc] init];
    questionVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"问答" image:nil tag:tagIdx++];
    questionVC.title = @"问答";
    self.questionNav = [self  makeNav:questionVC];
    
    TYLoveViewController *loveVC = [[TYLoveViewController alloc] init];
    loveVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"喜欢" image:nil tag:tagIdx++];
    loveVC.title = @"喜欢";
    self.loveNav = [self  makeNav:loveVC];

    TYMineViewController *mineVC = [[TYMineViewController alloc] init];
    mineVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:nil tag:tagIdx++];
    mineVC.title = @"我的";
    self.mineNav = [self makeNav:mineVC];
    
    
    self.viewControllers = @[self.homeNav,self.questionNav,self.loveNav,self.mineNav];
    
}


@end
