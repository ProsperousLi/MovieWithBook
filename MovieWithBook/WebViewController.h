//
//  WebViewController.h
//  MovieWithBook
//
//  Created by dragon on 17/4/16.
//  Copyright © 2017年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AfterFindView.h"

@interface WebViewController : UIViewController

@property (nonatomic,strong) AfterFindView *afterView;

@property (nonatomic,strong) NSString *commentURL;

@property (nonatomic,strong) UIWebView *webView;

@end
