//
//  goodMovieViewController.m
//  MovieWithBook
//
//  Created by dragon on 16/10/30.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "goodMovieViewController.h"

@interface goodMovieViewController ()

@end

@implementation goodMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _model = [[goodMovieModel alloc] init];
    
    NSLog(@"%@",_navigationTitle);
    
    self.navigationItem.title = _navigationTitle;
    
    _afterView = [[AfterFindView alloc] init];
    
    [self.view addSubview:self.afterView];
    
    [self.view addSubview:self.tableView];
    
    [self getHttp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 44)];
        
        _tableView.backgroundColor = [UIColor colorWithHex:primary_color_0];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
    }
    
    return _tableView;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *Cellidentifier = @"Cell";
    
    UITableViewCell *cell;
    
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cellidentifier];

        
        cell.backgroundColor = [UIColor clearColor];
        
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/20, ScreenHeight/100, ScreenWidth/17, ScreenHeight/20)];
        lable.backgroundColor = [UIColor clearColor];
        
        lable.textColor = [UIColor colorWithHex:main_text_title_color_dark];
        
        lable.text = [_model.rowNum objectAtIndex:indexPath.row];
        
        UILabel *addressLable = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/8, ScreenHeight/100, ScreenWidth*(2/3.0), ScreenHeight/20)];
        
        addressLable.backgroundColor = [UIColor clearColor];
        
        addressLable.textColor = [UIColor colorWithHex:main_text_title_color_dark];
        
        addressLable.text = [_model.cinemaName objectAtIndex:indexPath.row];
        
        //lable.text = [_model.cinemaName objectAtIndex:indexPath.row];
        
        UILabel *todayBoxLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/7, ScreenHeight/100 + ScreenHeight/15, ScreenWidth/2, ScreenHeight/20)];
        
        todayBoxLabel.backgroundColor = [UIColor clearColor];
        
        todayBoxLabel.textColor = [UIColor colorWithHex:main_text_title_color_dark];
        
        todayBoxLabel.text = [NSString stringWithFormat:@"单日票房 %@ 元",[_model.todayBox objectAtIndex:indexPath.row]];
        
        todayBoxLabel.font = [UIFont systemFontOfSize:12];
        
        
        
        [cell.contentView addSubview:lable];
        
        [cell.contentView addSubview:addressLable];
        
        [cell.contentView addSubview:todayBoxLabel];
        
    }
    

    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_model.cinemaName count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *myCell=[self tableView:tableView cellForRowAtIndexPath:indexPath];//获取当前indexPath中的cell实例
    myCell.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight/6);
    
    return myCell.frame.size.height;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TRUE;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.5f];
}


- (void)deselect
{
    [_tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:YES];
}


-(void)getHttp {
    
    refreshActivityIndicatorView *refreshView = [[refreshActivityIndicatorView alloc] init];
    
    [self.view addSubview:refreshView];
    
    [refreshView startAnimating];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    
    [manager GET:PAIHANGHttp parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [refreshView stopAnimating];
        
        _model = [[goodMovieModel alloc] init];
        
        [_model initWithDict:responseObject];
        
        [_tableView reloadData];
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",[error localizedDescription]);
    }];
}


@end
