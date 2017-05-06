//
//  FindView.h
//  MovieWithBook
//
//  Created by 13110100307 on 16/10/20.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"
#import "MovieNewsModel.h"

@interface FindView : UIView <UITableViewDelegate,UITableViewDataSource>

-(instancetype)init;

/**
 * 电影热评Model
 */
@property (nonatomic,strong) CommentModel *commentModel;

/**
 * 资讯model
 */
@property (nonatomic,strong) MovieNewsModel * newsModel;

/**
 *  背景
 */
@property (nonatomic,strong) UITableView *tableView;

/**
 *  存放类别的array
 */
@property (nonatomic,strong) NSArray *CellArray;

/**
 * 类别图片
 */
@property (nonatomic,strong) NSArray *CellImageArray;

/**
 * top 20等三个功能
 */
@property (nonatomic,strong) void (^cellDidSelectAction)(NSInteger index,NSArray *array);

/**
 * 热评
 */
@property (nonatomic,strong) void (^commentDetailAction)(NSInteger index,NSArray *array);

/**
 * 资讯
 */
@property (nonatomic,strong) void (^NewsAction)(NSString *url);

/**
 * 更多（资讯、热评）
 */
@property (nonatomic,strong) void (^moreAction)(NSInteger tag);

@end
