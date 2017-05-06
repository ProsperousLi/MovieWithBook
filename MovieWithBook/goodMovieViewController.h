//
//  goodMovieViewController.h
//  MovieWithBook
//
//  Created by dragon on 16/10/30.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AfterFindView.h"
#import "goodMovieModel.h"

@interface goodMovieViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) AfterFindView *afterView;

/**
 *  标题
 */
@property (nonatomic,strong) NSString *navigationTitle;

/**
 *  确认点击的是哪个
 */
@property(nonatomic,strong)NSString *indexCell;


@property (nonatomic,strong)UITableView *tableView;


@property (nonatomic,strong) goodMovieModel *model;

@end
