//
//  MoreInformationViewController.h
//  MovieWithBook
//
//  Created by dragon on 17/5/6.
//  Copyright © 2017年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AfterFindView.h"
#import "WebViewController.h"

@interface MoreInformationViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) AfterFindView *afterView;

/**
 * 判断是谁点击了
 */
@property (nonatomic) int index;

/**
 * 标题
 */
@property (nonatomic,strong) NSMutableArray *titleArray;

/**
 * 豆瓣影评简介
 */
@property (nonatomic,strong) NSMutableArray *contentArray;

/**
 * 图片
 */
@property (nonatomic,strong) NSMutableArray *imageArray;

/**
 * 猫眼图片数量
 */
@property (nonatomic,strong) NSMutableArray *numberImageViewArray;

/**
 * 作者
 */
@property (nonatomic,strong) NSMutableArray *nickName;

/**
 * 豆瓣影名
 */
@property (nonatomic,strong) NSMutableArray *movieName;

/**
 * 猫眼时间
 */
@property (nonatomic,strong) NSMutableArray *maoyanTime;

/**
 * url
 */
@property(nonatomic,strong) NSMutableArray *urlArray;

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) WebViewController *webVC;

@end
