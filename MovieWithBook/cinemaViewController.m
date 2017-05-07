//
//  cinemaViewController.m
//  MovieWithBook
//
//  Created by dragon on 16/10/21.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "cinemaViewController.h"

@interface cinemaViewController ()

@end

@implementation cinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"影院列表";
    
    _cinemaView = [[cinemaView alloc] init];
    
    [self.view addSubview:_cinemaView];
    
    [self.view addSubview:self.cinemaTableView];
    
    [self initializeLocationService];
    
    [self getHttp];


}



-(void) distance:(NSInteger) index{
    
    // NSLog(@"%@",_model.longitude[0]);
    
    
    
    //double lang = [_model.longitude[index] doubleValue];
    
    //double lat = [_model.latitude[index] doubleValue];
    
    // NSLog(@"第%ld个 lang :%lf",(long)index,lang);
    
    // NSLog(@"第%ld个 lat :%lf",(long)index,lat);
    
    
    //double distance = [distanceLocation LantitudeLongitudeDist:_langCurrent other_Lat:_latCurrent self_Lon:lang self_Lat:lat];
    
    //_distanceCurrent = distance;
    
    //CLLocation *orig=[[CLLocation alloc] initWithLatitude:lat longitude:lang];
    
    //CLLocation* dist=[[CLLocation alloc] initWithLatitude:_latCurrent longitude:_langCurrent];
    
    //CLLocationDistance kilometers=[dist distanceFromLocation:orig]/1000;
    
    //NSLog(@"第%ld个 距离:%@",(long)index,[NSString stringWithFormat:@"%.0lfkm",kilometers]);
    
    //NSLog(@"第%ld个 距离 %.01lf km",(long)index,distance/1000.0);
}

- (void)initializeLocationService {
    
    if ([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized)) {
        
        
        // 初始化定位管理器
        _locationManager = [[CLLocationManager alloc] init];
        // 设置代理
        _locationManager.delegate = self;
        
        // 设置定位精确度到米
        _locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        // 设置过滤器为无
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        
        
        [_locationManager requestWhenInUseAuthorization];//使用程序其间允许访问位置数据（iOS8定位需要）
        // 开始定位
        [_locationManager startUpdatingLocation];
        //定位功能可用
        
    }else if ([CLLocationManager authorizationStatus] ==kCLAuthorizationStatusDenied) {
        NSLog(@"不可用");
        
        //定位不能用
        
    }
};


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    //NSLog(@"成功调用");
    
    CLLocation *newLocation = [locations firstObject];
    
    _langCurrent = newLocation.coordinate.longitude;
    
    _latCurrent = newLocation.coordinate.latitude;
    
    //NSLog(@"经度 %lf",newLocation.coordinate.longitude);
    
    //NSLog(@"纬度 %lf",newLocation.coordinate.latitude);
    
    
    //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新
    [manager stopUpdatingLocation];
}

-(UITableView *)cinemaTableView {
    if (!_cinemaTableView) {
        _cinemaTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64)];
        _cinemaTableView.backgroundColor = [UIColor colorWithHex:primary_color_0];
        
        _cinemaTableView.delegate = self;
        _cinemaTableView.dataSource = self;
    }
    
    return _cinemaTableView;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [self distance:indexPath.row];
    
    static NSString *Cellidentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:Cellidentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:Cellidentifier];
    }
    else {
        //解决cell复用的问题
        while ([cell.contentView.subviews lastObject] !=nil) {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(10, ScreenHeight/100, ScreenWidth, ScreenHeight/20)];
    lable.backgroundColor = [UIColor clearColor];
    
    lable.textColor = [UIColor blackColor];
    
    lable.text = [_model.cinemaName objectAtIndex:indexPath.row];
    
    UILabel *addressLable = [[UILabel alloc] initWithFrame:CGRectMake(10, ScreenHeight/100 + ScreenHeight/15, ScreenWidth*(2/3.0), ScreenHeight/20)];
    
    addressLable.backgroundColor = [UIColor clearColor];
    
    addressLable.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
    
    addressLable.text = [_model.address objectAtIndex:indexPath.row];
    
    addressLable.font = [UIFont systemFontOfSize:12];
    
    lable.text = [_model.cinemaName objectAtIndex:indexPath.row];
    
    UILabel *distanceLable = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/1.4, ScreenHeight/100 + ScreenHeight/15, ScreenWidth/3, ScreenHeight/20)];
    
    distanceLable.backgroundColor = [UIColor clearColor];
    
    distanceLable.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
    
    distanceLable.text = [NSString stringWithFormat:@"距离你：%.01lfkm",_distanceCurrent/1000.0];
    
    distanceLable.font = [UIFont systemFontOfSize:12];
    
    [cell.contentView addSubview:lable];
    
    [cell.contentView addSubview:addressLable];
    
    [cell.contentView addSubview:distanceLable];
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [_imageArray count];
    //AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
    
    //NSLog(@"%lu",(unsigned long)[appDelegate.nameArray count]);
    
    //return  [appDelegate.nameArray count];
    return [_model.cinemaName count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *myCell=[self tableView:tableView cellForRowAtIndexPath:indexPath];//获取当前indexPath中的cell实例
    myCell.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight/8);
    
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
    
    _webVC = [[cinemaWebViewController alloc] init];
    
    _webVC.navigationItem.title = [_model.cinemaName objectAtIndex:indexPath.row];
    
    _webVC.titleName = [_model.cinemaName objectAtIndex:indexPath.row];
    
    _webVC.url = [NSString stringWithFormat:@"%@%@%@%@%@%d-0%d-0%d",cinemaDetailWebViewUrl,[_model.idArray objectAtIndex:indexPath.row],cineZhongUrl,self.idItem,cinemaDetailWebViewafterUrl,_year1,_month1,_day1];
    
    _webVC.idStr = [_model.idArray objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:_webVC animated:YES];
    
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.5f];
}


- (void)deselect
{
    [_cinemaTableView deselectRowAtIndexPath:[_cinemaTableView indexPathForSelectedRow] animated:YES];
}


-(void)getHttp {
    
    refreshActivityIndicatorView *refreshView = [[refreshActivityIndicatorView alloc] init];
    
    [self.view addSubview:refreshView];
    
    [refreshView startAnimating];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    

    
    NSDate *now = [NSDate date];
   // NSLog(@"now date is: %@", now);
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    
    _year1 =(int) [dateComponent year];
    _month1 = (int) [dateComponent month];
    _day1 = (int) [dateComponent day];
//    int hour1 = (int) [dateComponent hour];
//    int minute1 = (int) [dateComponent minute];
//    int second1 = (int) [dateComponent second];
    
    NSString *url = [NSString stringWithFormat:@"%@%@%@%d-%d-%d%@",cinemaDataPreHttp,self.idItem,cinemaDataToudayDateHttp,_year1,_month1,_day1,cinemaDataLocationHttp];
    if (_day1 < 10) {
        url = [NSString stringWithFormat:@"%@%@%@%d-%d-0%d%@",cinemaDataPreHttp,self.idItem,cinemaDataToudayDateHttp,_year1,_month1,_day1,cinemaDataLocationHttp];
    }
    
    if (_month1 < 10) {
        url = [NSString stringWithFormat:@"%@%@%@%d-0%d-%d%@",cinemaDataPreHttp,self.idItem,cinemaDataToudayDateHttp,_year1,_month1,_day1,cinemaDataLocationHttp];
    }
    
    [manager POST:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [refreshView stopAnimating];
        
        _model = [[cinemaModel alloc] init];
        
        [_model initWithDict:responseObject];
        
        
        [_cinemaTableView reloadData];
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",[error localizedDescription]);
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
