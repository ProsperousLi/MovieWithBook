//
//  cinemaWebViewController.m
//  MovieWithBook
//
//  Created by dragon on 17/5/5.
//  Copyright © 2017年 13110100307. All rights reserved.
//

#import "cinemaWebViewController.h"

@interface cinemaWebViewController ()

@end

@implementation cinemaWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSLog(@"%@",self.url);
    
    self.view.frame = [UIScreen mainScreen].bounds;
    
    self.view.backgroundColor = [UIColor colorWithHex:primary_color_0];
    
    self.view = self.webView;
    // Do any additional setup after loading the view.
}

-(UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight + 15)];
        
        _webView.backgroundColor = [UIColor whiteColor];
        
        _webView.scalesPageToFit =YES;//自动对页面进行缩放以适应屏幕
        
        NSURL *url = [NSURL URLWithString:self.url];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        _webView.delegate = self;
        
        [_webView loadRequest:request];
    }
    
    return _webView;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {

    
    NSString *str = @"var s= document.getElementsByTagName(\"a\");\n"
    @"for(var i=0;i<s.length;i++)\n"
    @"{\n"
    @"s[i].removeAttribute('href');\n"
    @"s[i].removeAttribute('data-url');\n"
    @"}\n";
    
    // 在HTML标签都加载完成后,开始处理HTML标签,调用JS,操作document，删除a标签的链接
    //[webView stringByEvaluatingJavaScriptFromString:str];

    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //NSLog(@"set");

    if ([request.URL.absoluteString hasPrefix:@"https://movie.douban.com/ticket/"]) {
        //[self btnClicked:[UIButton buttonWithType:UIButtonTypeCustom]];
        NSLog(@"click");
        
        NSString *getcontent = [NSString stringWithFormat:@"document.getElementByTagName(\"a\")[0].textContent;"];
        
        NSLog(@"内容 :%@",[_webView stringByEvaluatingJavaScriptFromString:getcontent]);
        
        _chooseVC = [[ChooseSeatViewController alloc] init];
        
        _chooseVC.navigationItem.title = self.titleName;
        
        [self.navigationController pushViewController:_chooseVC animated:YES];
        
        return NO;
    }
    
    //判断是否是单击
    if (navigationType == UIWebViewNavigationTypeLinkClicked)
    {
        NSLog(@"tap");
        //获取a标签的点击事件
        
        NSString *clickStrJS = @"ar aLink=document.getElementsByTagName(\"a\");"
        @"for(i=0;i<aLink.length;i++) {\n"
        @"aLink[i].onclick=show;\n"
        @"}\n"
        @"function show()\n"
        @"{\n"
        @"\n"
        @"}\n";
        
        return NO;
        
    }
    return YES;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
