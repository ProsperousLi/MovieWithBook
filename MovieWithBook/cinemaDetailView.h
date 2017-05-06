//
//  cinemaDetailView.h
//  MovieWithBook
//
//  Created by dragon on 16/10/22.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cinemaDetailModel.h"

@interface cinemaDetailView : UIView <UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) cinemaDetailModel *model;

@property (nonatomic,strong) UICollectionView *collectionView;

/**
 *  放置电影列表的背景View
 */
@property (nonatomic,strong) UIView *backgroudView;

/**
 *  影片大概信息
 */
@property (nonatomic,strong) UIView *informationView;

/**
 *  影名
 */
@property (nonatomic,strong) UILabel *movie_nameLabel;

/**
 *  评分
 */
@property (nonatomic,strong) UILabel *sorceLabel;

/**
 *  时间，类型，主演信息
 */
@property (nonatomic,strong) UILabel *information;


@property (nonatomic,strong) void (^cellDidSelectAction)(NSInteger index);


@property (nonatomic,strong) void (^reloadCellAction)(void);


@property (nonatomic,strong)UITableView *tableView;


-(instancetype)init;

-(void)getHttp;

@end
