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
    
    _refreshView = [[refreshActivityIndicatorView alloc] init];
    
    [self.view addSubview:_refreshView];
    
    [_refreshView startAnimating];
    
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

    [_refreshView stopAnimating];
    
//    NSString *str = @"var s= document.getElementsByTagName(\"a\");\n"
//    @"for(var i=0;i<s.length;i++)\n"
//    @"{\n"
//    @"s[i].removeAttribute('href');\n"
//    @"s[i].removeAttribute('data-url');\n"
//    @"}\n";
//    // 在HTML标签都加载完成后,开始处理HTML标签,调用JS,操作document，删除a标签的链接
//    [webView stringByEvaluatingJavaScriptFromString:str];

    
    //加载后注入js代码，第一次点击标签代码就有效
    //开场时间
    //类型
    //影片时长
    //价格
    NSString * biaoQianStr = @"var beginTime = 0;\n"
                     @"var type = 0;\n"
                     @"var MovieTime = 0;\n"
                     @"var price = 0;\n"
    @"var s = document.getElementsByTagName('a');\n"
    @"for(var i=0;i<s.length;i++)\n"
    @"{\n"
    @"s[i].onclick=function()\n"
    @"{\n"
    @"beginTime = this.innerText.substring(0,5);\n"
    @"type = this.innerText.substring(6,12);\n"
    @"MovieTime = this.innerText.substring(12,18);\n"
    @"price = this.innerText.substring(19,22);\n"
    @"}\n"
    @"}";
    
    [_webView stringByEvaluatingJavaScriptFromString:biaoQianStr];
    
    //注入关于日期的代码
    NSString *dateStr = @"var movieDate = 0;\n"
    
    @"var q=document.getElementsByTagName('li');\n"
    @"for(var i=0;i<q.length;i++) {\n"
    @"q[i].onclick=function() {\n"
    @"movieDate = this.innerText;\n"
    @"}\n"
    @"}\n";
    
    [_webView stringByEvaluatingJavaScriptFromString:dateStr];
    
    //注入获取当前图片的代码
    NSString *imageStr = @"var MovieImageUrl = 0;\n"
    
    @"var img = document.getElementsByTagName('img');\n"
    
    @"var imgLength = img.length;\n"
    
    @"for (var i = 0; i < img.length; i++) {\n"
    
    @"img[i].onclick = function() {\n"
    
    @"MovieImageUrl = this.src;"
    
    @"}\n"
    
    @"}\n";
    
    [_webView stringByEvaluatingJavaScriptFromString:imageStr];

}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if ([request.URL.absoluteString hasPrefix:@"https://movie.douban.com/ticket/"]) {

        //选择时间时，获取当前显示的影片名
        self.MovieName = [_webView stringByEvaluatingJavaScriptFromString:
                         @"document.getElementsByTagName('h1')[0].innerHTML;"];
        NSLog(@"影片名:%@",self.MovieName);

        
        //获取image
        self.MovieImageUrl = [_webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('carousel-item is-active')[0].getElementsByTagName('img')[0].src;"];
        NSLog(@"图片:%@",self.MovieImageUrl);
        
//        //获取日期dates
//        self.movieDate = [_webView stringByEvaluatingJavaScriptFromString:
//                         @"document.getElementsByTagName('div')[0].getElementsByClassName('date is-active')[0].innerHTML"];
//        NSLog(@"日期:%@",self.movieDate);
        
        
//        //获取所有标签个数
//        NSString * getcontent = [NSString stringWithFormat:@"MovieImageUrl;"] ;
//        
//        NSString *numberstr = [_webView stringByEvaluatingJavaScriptFromString:getcontent];
//        
//        int biaoQianNumber = [numberstr intValue];
//        
//        NSLog(@"标签个数:%d",biaoQianNumber);
        

        //开始时间
        self.beginTime = [_webView stringByEvaluatingJavaScriptFromString:@"beginTime;"];
        
        NSLog(@"开始时间:%@",self.beginTime);
        
        
        //类型
        self.type = [_webView stringByEvaluatingJavaScriptFromString:@"type;"];
        
        NSLog(@"类型:%@",self.type);
        
        //时长
        self.MovieTime = [_webView stringByEvaluatingJavaScriptFromString:@"MovieTime;"];
        
        NSLog(@"时长:%@",self.MovieTime);
        
        //价格
        self.price = [_webView stringByEvaluatingJavaScriptFromString:@"price;"];
        
        NSLog(@"价格:%@",self.price);
        
        //跳转
        _chooseVC = [[ChooseSeatViewController alloc] init];
        
        _chooseVC.navigationItem.title = self.titleName;
        
        _chooseVC.movieName = self.MovieName;
        
         _chooseVC.movieBeginTime = self.beginTime;
        
         _chooseVC.movieType = self.type;
        
         _chooseVC.movieTime = self.MovieTime;
        
         _chooseVC.moviePrice = self.price;
        
         _chooseVC.movieImageUrl = self.MovieImageUrl;
        
        [self.navigationController pushViewController:_chooseVC animated:YES];
        
        return NO;
    }
    
    //判断是否是单击
    if (navigationType == UIWebViewNavigationTypeLinkClicked)
    {
        NSLog(@"tap");

        return NO;
        
    }
    return YES;
    
//    var s= document.getElementsByTagName("a");
//    for(var i=0;i<s.length;i++)
//    {
//        s[i].removeAttribute('href');
//        s[i].removeAttribute('data-url');
    
//        s[i].onclick=function()
//        {
//            this.innerText.substring(0,5);  //开场时间
//            this.innerText.substring(6,12); //类型
//            this.innerText.substring(13,18); //影片时间
//            this.innerText.substring(19,22); //价格
//        }
//    }
//    var v= document.getElementsByTagName("h1");
//    
//    for(var i=0;i<v.length;i++)
//    {
//        
//        v[0].innerHTML;  //影片名
//        
//    }
//    var q=document.getElementsByTagName('li');
//    for(var i=0;i<q.length;i++)
//    {
//        
//        q[i].onclick=function()
//        {
//            this.innerText;  //日期
//        }
//        
//    }

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
