//
//  DetailView.h
//  MovieWithBook
//
//  Created by 13110100307 on 16/9/5.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailModel.h"

@interface DetailView : UIView <UITextViewDelegate>

@property (nonatomic,strong) DetailModel *model;

@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,strong) UIImageView *imageView;

@property (nonatomic,strong) UIView *buyView;

@property (nonatomic,strong) UIButton *buyButton;

@property (nonatomic,strong) UILabel *title;

/**
 *  电影原名,标签控件
 */
@property (nonatomic,strong) UILabel *original_title;

/**
 *  评分
 */

@property (nonatomic,strong) UILabel *avg;

/**
 *  类型
 */

@property (nonatomic,strong) UILabel *genres;

/**
 * 国家、地区
 */

@property (nonatomic,strong) UILabel *countries;

/**
 *  简介
 */
@property (nonatomic,strong) UITextView *textView;

/**
 * 简介上覆盖一个view，实现简介的展开与收缩
 */
@property (nonatomic,strong) UIView *On_TextView;





@property (nonatomic,copy) void (^DidBuyAction)(void);

-(instancetype)init;

@end
