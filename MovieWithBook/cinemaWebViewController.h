//
//  cinemaWebViewController.h
//  MovieWithBook
//
//  Created by dragon on 17/5/5.
//  Copyright © 2017年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "ChooseSeatViewController.h"
#import "ChooseSeatView.h"

@interface cinemaWebViewController : UIViewController<UIWebViewDelegate>

@property (nonatomic,strong) NSString *url;

@property (nonatomic,strong) NSString *idStr;

@property (nonatomic,strong) UIWebView *webView;

@property (nonatomic,copy) NSString *titleName;

@property (nonatomic,strong) ChooseSeatView *chooseSeatView;

@property (nonatomic,strong) ChooseSeatViewController *chooseVC;

@property (nonatomic,strong)refreshActivityIndicatorView *refreshView;

//获取js的元素和值
/**
 * 开始时间
 */
@property (nonatomic,strong)NSString *beginTime;

/**
 * 类型
 */
@property (nonatomic,strong)NSString *type;

/**
 * 时长
 */
@property (nonatomic,strong)NSString *MovieTime;

/**
 * 价格
 */
@property (nonatomic,strong)NSString *price;

/**
 * 影片名
 */
@property (nonatomic,strong)NSString *MovieName;

/**
 * 影片图片url
 */
@property (nonatomic,strong)NSString *MovieImageUrl;

/**
 * 观影日期
 */
@property (nonatomic,strong)NSString *movieDate;

@end
