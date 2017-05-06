//
//  cinemaViewController.h
//  MovieWithBook
//
//  Created by dragon on 16/10/21.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cinemaDetailViewController.h"
#import "cinemaView.h"
#import "cinemaDetailView.h"
#import "cinemaWebViewController.h"

@interface cinemaViewController : UIViewController

@property (nonatomic,strong) cinemaView *cinemaView;

@property (nonatomic,strong) cinemaWebViewController *webVC;

@property (nonatomic,strong) cinemaDetailViewController *cinemaVC;

@property (nonatomic,strong) cinemaDetailView *cinDetailView;

@property (nonatomic,strong) NSString *idItem;

@property (nonatomic,strong) cinemaModel *model;

@property (nonatomic,strong)UITableView *cinemaTableView;


@property int year1;

@property int month1;

@property int day1;

/**
 *  当前位置与影院的距离
 */
@property double distanceCurrent;

/**
 * 当前位置的经度
 */
@property double langCurrent;

/**
 *  当前位置的纬度
 */
@property double latCurrent;

@property (nonatomic,strong) CLLocationManager * locationManager;


@end
