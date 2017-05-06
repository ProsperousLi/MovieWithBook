//
//  WebViewController.m
//  MovieWithBook
//
//  Created by dragon on 17/4/16.
//  Copyright © 2017年 13110100307. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _afterView = [[AfterFindView alloc] init];
    
    [_afterView addSubview:self.webView];
    
    [self.view addSubview:self.afterView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, -15, ScreenWidth, ScreenHeight + 15)];
        
        _webView.backgroundColor = [UIColor whiteColor];
        
        _webView.scalesPageToFit =YES;//自动对页面进行缩放以适应屏幕
        
        NSURL *url = [NSURL URLWithString:self.commentURL];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        [_webView loadRequest:request];
    }
    
    return _webView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
