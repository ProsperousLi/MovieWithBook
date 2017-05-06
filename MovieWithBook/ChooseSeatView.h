//
//  ChooseSeatView.h
//  MovieWithBook
//
//  Created by 13110100307 on 16/10/27.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseSeatView : UIView

@property (nonatomic,strong) UILabel *typeLabel;

@property (nonatomic,strong) UILabel *cinema_nameLabel;

@property (nonatomic,strong) UIButton *selectButton;

@property (nonatomic,strong) UIButton *didiSelectButton;

@property (nonatomic,strong) UIButton *SelecttingButton;

/**
 *  显示座位标识的背景
 */
@property (nonatomic,strong) UIView *seatImageView;


/**
 *  存放座位背景的scrollview
 */
@property (nonatomic,strong) UIScrollView *seatScrollView;


/**
 *  显示座位的背景
 */
@property (nonatomic,strong) UIView *seatView;

/**
 *  座位左侧的排号
 */
@property (nonatomic) UIView *paiView;

/**
 *  屏幕
 */
@property (nonatomic) UILabel *PingMuLabel;

/**
 *  存储已经点击的按钮的tag
 */
@property (nonatomic,strong) NSMutableArray *didselectButtonTagArray;


/**
 *  存储已经点击的按钮
 */
@property (nonatomic,strong) NSMutableArray *selectButtonArray;

/**
 *  确认购买按钮
 */
@property (nonatomic,strong) UIButton *reallyBuybutton;

/**
 *  存储票的数据的按钮
 */
@property (nonatomic,strong) NSMutableArray *piaoShowButton;


/**
 *  存储票的数据的排
 */
@property (nonatomic,strong) NSMutableArray *piaoPaiArray;

/**
 *  票的数据座
 */
@property (nonatomic,strong) NSMutableArray *piaoZuoArray;

@property (nonatomic,strong) void (^DidAction)();

-(instancetype)init;

@end
