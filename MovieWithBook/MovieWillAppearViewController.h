//
//  MovieWillAppearViewController.h
//  MovieWithBook
//
//  Created by dragon on 16/10/30.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AfterFindView.h"
#import "MovieWillAppearModel.h"
#import "TrailerModel.h"
#import "WebViewController.h"


@interface MovieWillAppearViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) WebViewController *webVC;

@property (nonatomic,strong) AfterFindView *afterView;

/**
 *  标题
 */
@property (nonatomic,strong) NSString *navigationTitle;

/**
 *  确认点击的是哪个
 */
@property(nonatomic,strong)NSString *indexCell;


/**
 * collectionView
 */
@property (nonatomic,strong) UICollectionView *collectionView;


/**
 * 预告片collectionView
 */
@property (nonatomic,strong) UICollectionView *collectionViewTwo;


@property (nonatomic,strong) TrailerModel *trailerModel;


@property (nonatomic,strong) MovieWillAppearModel *model;


/**
 * 预告片
 */
@property (nonatomic,strong) void (^TrailerAction)(NSString *url);
@end
