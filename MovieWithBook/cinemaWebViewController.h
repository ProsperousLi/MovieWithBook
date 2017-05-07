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

@interface cinemaWebViewController : UIViewController<UIWebViewDelegate>

@property (nonatomic,strong) NSString *url;

@property (nonatomic,strong) NSString *idStr;

@property (nonatomic,strong) UIWebView *webView;

@property (nonatomic,copy) NSString *titleName;

@property (nonatomic,strong) ChooseSeatViewController *chooseVC;

@end
