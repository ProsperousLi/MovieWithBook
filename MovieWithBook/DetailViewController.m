//
//  DetailViewController.m
//  MovieWithBook
//
//  Created by 13110100307 on 16/9/5.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailModel.h"


@interface DetailViewController ()

@property (nonatomic,strong) DetailModel *model;

@end

//是否点击的indx
static int TapIndex = 0;

@implementation DetailViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    TapIndex = 0; //初始化
    
    _model = [[DetailModel alloc] init];
    
    [self getIdHttp];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"影视详情";
    
    // Do any additional setup after loading the view.
    
    _detailView = [[DetailView alloc] init];
    
    _perVC = [[personalViewController alloc] init];
    
    
    [self.view addSubview:_detailView];
    
    [_detailView.scrollView addSubview:self.directorsImageView];
    
    [self blockAction];
    
    [self addTap];
    
}

//添加一个展开，收缩点击事件
-(void) addTap {
    UITapGestureRecognizer *single = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleAction:)];
    
    single.numberOfTapsRequired = 1;
    
    [_detailView.On_TextView addGestureRecognizer:single];
}

-(void)singleAction:(UITapGestureRecognizer *)tap {
    if (TapIndex == 0) {
        TapIndex = 1;
        _detailView.textView.frame = CGRectMake(0, ScreenHeight/15 + (2 * ScreenWidth/3 + ScreenWidth/10), ScreenWidth, ScreenHeight/11.5);
        
        //[_detailView.scrollView setContentSize:CGSizeMake(0, ScreenHeight)];
        [_detailView.scrollView setContentSize:CGSizeMake(0, 0)];

    }
    else {
        TapIndex = 0;
        _detailView.textView.frame = CGRectMake(0, ScreenHeight/15 + (2 * ScreenWidth/3 + ScreenWidth/10), ScreenWidth, _height);
        
        [_detailView.scrollView setContentSize:CGSizeMake(0, ScreenHeight - _yuanHeight + _height)];
        

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImageView *)directorsImageView {
    if (!_directorsImageView) {
        UILabel *directorsLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/20, ScreenWidth*(5/12.0) - ScreenWidth/50, ScreenWidth/6, ScreenHeight/20)];
        
        directorsLabel.backgroundColor = [UIColor clearColor];
        
        directorsLabel.text = @"导演";
        
        directorsLabel.textColor = [UIColor colorWithHex:primary_color_grey_400];
        
        [_detailView.scrollView addSubview:directorsLabel];
        
        _directorsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/20, ScreenWidth*(5/12.0) + ScreenWidth/18, ScreenWidth/6, ScreenWidth/5)];
        
        _directorsImageView.backgroundColor = [UIColor clearColor];
        
       // NSLog(@"%@",_dirctorImage);
        
        [_directorsImageView sd_setImageWithURL:[NSURL URLWithString:_dirctorImage[0]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        
        UILabel *directNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/20, ScreenWidth*(5/12.0) + ScreenWidth/5 +ScreenWidth/18, ScreenWidth/6, ScreenHeight/20)];
        
        directNameLabel.text = _dirctorName[0];
        
        directNameLabel.font = [UIFont systemFontOfSize:11];
        
        directNameLabel.textColor = [UIColor colorWithHex:main_text_title_color_dark];
        
        [_detailView.scrollView addSubview:directNameLabel];
        
        UILabel *castsLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/3, ScreenWidth*(5/12.0) - ScreenWidth/50, ScreenWidth/6, ScreenHeight/20)];
        castsLabel.backgroundColor = [UIColor clearColor];
        
        castsLabel.text = @"演员";
        
        
        castsLabel.textColor = [UIColor colorWithHex:primary_color_grey_400];
        
        [_detailView.scrollView addSubview:castsLabel];
        
    
        for (int i = 0; i < [_castsImage count]; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/ 3 + (ScreenWidth/6 + ScreenWidth/20) * i, ScreenWidth*(5/12.0) + ScreenWidth/18, ScreenWidth/6, ScreenWidth/5)];
            
            imageView.backgroundColor = [UIColor clearColor];
            
            
            //NSLog(@"%@",_castsImage);
            [imageView sd_setImageWithURL:[NSURL URLWithString:[_castsImage objectAtIndex:i]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            
            [_detailView.scrollView addSubview:imageView];
            
            
            UILabel *castNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/ 3 + (ScreenWidth/6 + ScreenWidth/20) * i, ScreenWidth*(5/12.0) + ScreenWidth/5 + ScreenWidth/18, ScreenWidth/6, ScreenHeight/20)];
            
            castNameLabel.text = [_castsName objectAtIndex:i];
            
            castNameLabel.font = [UIFont systemFontOfSize:11];
            
            castNameLabel.textColor = [UIColor colorWithHex:main_text_title_color_dark];
            
            [_detailView.scrollView addSubview:castNameLabel];
        }
        
    }
    
    return _directorsImageView;

}


-(void)getIdHttp {
    NSString *string = @"https://api.douban.com/v2/movie/subject/";
    
    string = [string stringByAppendingString:[NSString stringWithFormat:@"%@",_idItem]];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    
    [manager GET:string parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [_model initWithDic:responseObject];
        
        [self updata];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",[error localizedDescription]);
    }];
}

-(void)updata {
    
    
    [_detailView.imageView  sd_setImageWithURL:[NSURL URLWithString:_mediumImage] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    _detailView.title.text = _currentTitle;
    
    _detailView.avg.text = [NSString stringWithFormat:@"%@",_average];
    
    NSString *genreSting = [[NSString alloc] init];
    
    int i = 0;
    for (NSString *sting in _model.genres) {
        genreSting = [genreSting stringByAppendingString:sting];
        if (i < [_model.genres count]-1) {
            genreSting = [genreSting stringByAppendingString:@","];
            
        }
        i++;
    }
    
    _detailView.genres.text = genreSting;
    
    
    NSString * ContriesSting = [[NSString alloc] init];
    
    i = 0;
    for (NSString *sting in _model.countries) {
        ContriesSting = [ContriesSting stringByAppendingString:sting];
        if (i < [_model.countries count] - 1) {
            ContriesSting = [ContriesSting stringByAppendingString:@","];
            
        }
        i++;
    }
    
    _detailView.countries.text = ContriesSting;
    
    
    _detailView.textView.text = _model.information;
    
    _detailView.original_title.text = _model.original_title;
    
    _yuanHeight = _detailView.textView.frame.size.height;
    
    
    _height = [self heightForString:_detailView.textView andWidth:_detailView.textView.frame.size.width] +  ScreenHeight/20 * 2;
    
    
    _detailView.textView.frame = CGRectMake(0, ScreenHeight/15 + (2 * ScreenWidth/3 + ScreenWidth/10), ScreenWidth, _height);
    
    
    
    [_detailView.scrollView setContentSize:CGSizeMake(0, ScreenHeight - _yuanHeight + _height)];
    
    
}

- (float) heightForString:(UITextView *)textView andWidth:(float)width{
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
}


-(void)blockAction {
    _detailView.DidBuyAction =^() {

        cinemaViewController *cvc = [[cinemaViewController alloc] init];
        
        //cvc.cinemaView = [[cinemaView alloc] init];
        
        cvc.idItem = self.idItem;
        
        [self.navigationController pushViewController:cvc animated:YES];
        
    };
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
