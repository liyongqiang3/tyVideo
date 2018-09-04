//
//  TYHomeViewController.m
//  tyVideo
//
//  Created by yongqiang li on 2018/8/24.
//  Copyright © 2018 yongqiang li. All rights reserved.
//

#import "TYHomeViewController.h"
#import "TYPlayerCell.h"

@interface TYHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic) UICollectionView *collectionView;

@end

@implementation TYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = TYColorWhite;
    [self.view addSubview:self.collectionView];
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        flowlayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowlayout.minimumLineSpacing = 0.0f;
        flowlayout.minimumInteritemSpacing = 0.0f;
        flowlayout.itemSize =  CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:flowlayout];
        [_collectionView registerClass:[TYPlayerCell class] forCellWithReuseIdentifier:@"plalyerCell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = TYColorWhite;
    }
    return _collectionView;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TYPlayerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"plalyerCell" forIndexPath:indexPath];
     cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    [cell curPlayerUrl:nil];
    return cell;
}

@end
