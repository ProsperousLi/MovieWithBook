//
//  ChooseSeatViewController.h
//  MovieWithBook
//
//  Created by 13110100307 on 16/10/27.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChooseSeatView.h"


@interface ChooseSeatViewController : UIViewController

@property (nonatomic,strong) ChooseSeatView *chooseView;

@property (nonatomic,strong) NSString * item_title;

@property (nonatomic,strong) NSString *cinema_name;

@property (nonatomic,strong) NSString *data;

/**
 * 影片名称
 */
@property (nonatomic,strong) NSString *movieName;

/**
 * 开始时间
 */
@property (nonatomic,strong)NSString *movieBeginTime;

/**
 * 类型
 */
@property (nonatomic,strong)NSString *movieType;

/**
 * 时长
 */
@property (nonatomic,strong)NSString *movieTime;

/**
 * 价格
 */
@property (nonatomic,strong)NSString* moviePrice;

/**
 * 图片
 */
@property (nonatomic,strong)NSString *movieImageUrl;

@property (nonatomic,strong) NSString *type;

@end
