//
//  TopView.h
//  MovieWithBook
//
//  Created by 13110100307 on 16/9/5.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "topModel.h"

@interface TopView : UIView <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) topModel *model;

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) UIScrollView *verticalView;

@property (nonatomic,strong) void (^cellDidSelectAction)(NSInteger index);

-(instancetype)init;

@end
