//
//  refreshActivityIndicatorView.h
//  MovieWithBook
//
//  Created by dragon on 17/5/6.
//  Copyright © 2017年 13110100307. All rights reserved.
//


//使用方法
//2.在加载网络之前调用该方法

// 自带菊花方法
//refreshActivityIndicatorView  refreshActivityIndicator = [[refreshActivityIndicatorView alloc]init];
//[self.view addSubview:refreshActivityIndicator];

// 动画开始
//[refreshActivityIndicator startAnimating];

//3.网络请求完成，数据加载后调用取消动画方法

// 动画结束
//[refreshActivityIndicator stopAnimating];

#import <UIKit/UIKit.h>

#define kWidth 375
#define KHeight 667
#define MYCOLOR [UIColor blackColor]

@interface refreshActivityIndicatorView : UIActivityIndicatorView

-(instancetype)init;

@end
