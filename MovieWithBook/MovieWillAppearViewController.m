//
//  MovieWillAppearViewController.m
//  MovieWithBook
//
//  Created by dragon on 16/10/30.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "MovieWillAppearViewController.h"

@import AVKit;
@import AVFoundation;

@interface MovieWillAppearViewController ()

@end

@implementation MovieWillAppearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _model = [[MovieWillAppearModel alloc] init];
    
    NSLog(@"%@",_navigationTitle);
    
    self.navigationItem.title = _navigationTitle;
    
    _afterView = [[AfterFindView alloc] init];
    
    [self.view addSubview:self.afterView];
    
    [_afterView  addSubview:self.collectionView];
    
    [_afterView  addSubview:self.collectionViewTwo];
    
    [self titlelabel];
    
    [self getHttp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)titlelabel {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake( 0, 65, ScreenWidth, 24)];
    
    label.text = @"  预告片推荐";
    
    label.textColor = [UIColor blackColor];
    
    label.backgroundColor = [UIColor colorWithHex:primary_color_500_mask];
    
    [_afterView addSubview:label];
}

-(UICollectionView *)collectionViewTwo {
    if (!_collectionViewTwo) {
        
        UICollectionViewFlowLayout *flowLaout = [[UICollectionViewFlowLayout alloc] init];
        [flowLaout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        flowLaout.minimumInteritemSpacing = 2;
        flowLaout.itemSize = CGSizeMake(230, 230);
        
        _collectionViewTwo = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64 + 24, ScreenWidth, 100) collectionViewLayout:flowLaout];
        
        _collectionViewTwo.backgroundColor = [UIColor whiteColor];
        
        _collectionViewTwo.bounces = YES;
        
        _collectionViewTwo.delegate =self;
        
        _collectionViewTwo.dataSource = self;
        
        
        [_collectionViewTwo registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];

    }
    
    return _collectionViewTwo;
}

-(UICollectionView *)collectionView {
    UICollectionViewFlowLayout *flowLaout = [[UICollectionViewFlowLayout alloc] init];
    [flowLaout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLaout.minimumInteritemSpacing = 0.0;
    
    _collectionView= [[UICollectionView alloc] initWithFrame:CGRectMake(0,100 + 24, ScreenWidth, ScreenHeight -ScreenHeight/6.2) collectionViewLayout:flowLaout];
    
    _collectionView.bounces = YES;
    _collectionView.delegate =self;
    _collectionView.dataSource = self;
    
    _collectionView.showsVerticalScrollIndicator = false;
    
    [_collectionView setBackgroundColor:[UIColor colorWithHex:primary_color_0]];
    
    
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    return _collectionView;
}

#pragma mark -CollectionView
//cell内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Cellidentifier = @"UICollectionViewCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Cellidentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithHex:primary_color_500_mask];
    
    //cell.frame
    
    if (collectionView == _collectionView) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 2 * ScreenWidth/3, ScreenWidth/2 - ScreenWidth/100, ScreenWidth/10)];
        
        label.backgroundColor = [UIColor colorWithHex:primary_color_0];
        
        label.font = [UIFont systemFontOfSize:13];
        
        label.text = [_model.nameArray objectAtIndex:indexPath.row];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        UIImageView* view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth/2 - ScreenWidth/100, 2 * ScreenWidth/3 )];
        
        [view sd_setImageWithURL:[NSURL URLWithString:[_model.imageArray objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        
        
        
        [cell.contentView addSubview:view];
        
        [cell.contentView addSubview:label];
    }
    
    else  {
        
        UIImageView* view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth/2.5,ScreenHeight/8)];
        
        [view sd_setImageWithURL:[NSURL URLWithString:[_trailerModel.imageArray objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        
        view.backgroundColor = [UIColor blackColor];
        
        [cell.contentView addSubview:view];
        
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, ScreenHeight/13, ScreenWidth/2.5, ScreenWidth/20)];
        
        title.backgroundColor = [UIColor clearColor];
        
        title.textColor = [UIColor whiteColor];
        
        title.font = [UIFont systemFontOfSize:14];
        
        title.text = [_trailerModel.titleArray objectAtIndex:indexPath.row];
        
        title.textAlignment = NSTextAlignmentLeft;
        
        [cell.contentView addSubview:title];
        
        
        UILabel *content = [[UILabel alloc] initWithFrame:CGRectMake(0, ScreenHeight/10, ScreenWidth/3.5, ScreenWidth/20)];
        
        content.backgroundColor = [UIColor clearColor];
        
        content.textColor = [UIColor whiteColor];
        
        content.font = [UIFont systemFontOfSize:12];
        
        content.text = [_trailerModel.contentArray objectAtIndex:indexPath.row];
        
        content.textAlignment = NSTextAlignmentLeft;
        
        [cell.contentView addSubview:content];
        
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/3, ScreenHeight/11, ScreenWidth/3 - ScreenWidth/3.5, ScreenWidth/3 - ScreenWidth/3.5)];
        
        imageView.image = [UIImage imageNamed:@"play.png"];
        
        [cell.contentView addSubview:imageView];

    }
    

    
    return cell;
}

//每个部分几个cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    if (collectionView == _collectionView) {
        
        return [_model.nameArray count];
     
    }
    
    else {
        return [_trailerModel.imageArray count];
    }
    
    
    return 0;
}

//有几个部分section
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    
    if (collectionView == _collectionView) {
    
        
    
        return CGSizeMake(ScreenWidth/2 - ScreenWidth/100, (2 * ScreenWidth/3 + ScreenWidth/10));
    }
    
    else {
        return CGSizeMake(ScreenWidth/2.5,ScreenHeight/8);
    }
    
    return CGSizeMake(0,0);
}

//定义每个UICollectionView 的 margin 四周边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    if (collectionView == _collectionView) {
    
        return UIEdgeInsetsMake(5, ScreenWidth/120, ScreenWidth/60, ScreenWidth/120);
    }
    else {
        return UIEdgeInsetsMake(ScreenWidth/120,ScreenWidth/40,ScreenWidth/120,ScreenWidth/40);
    }
    
    return UIEdgeInsetsMake(0,0,0,0);
}

//设置header的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView ==  _collectionViewTwo) {
        //self.TrailerAction([_trailerModel.urlArray objectAtIndex:indexPath.row]);
//        _webVC = [[WebViewController alloc] init];
//        
//        _webVC.commentURL = [_trailerModel.urlArray objectAtIndex:indexPath.row];
//        
//        [self.navigationController pushViewController:_webVC animated:YES];
        
        NSURL *url = [NSURL URLWithString:[_trailerModel.urlArray objectAtIndex:indexPath.row]];
        
        AVPlayer *player = [AVPlayer playerWithURL:url];
        
        AVPlayerViewController *playerVC = [AVPlayerViewController new];
        
        playerVC.player = player;
        
        [self presentViewController:playerVC animated:YES completion:nil];
        
        [playerVC.player play];
        
        
    }
    
    //NSLog(@"第%ld个cell被点击",(long)indexPath.row);
    
    
    
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


-(void)getHttp {
    refreshActivityIndicatorView *refreshView = [[refreshActivityIndicatorView alloc] init];
    
    [self.view addSubview:refreshView];
    
    [refreshView startAnimating];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    
    [manager GET:willAppearHttp parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [refreshView stopAnimating];
        
        [_model initWithDict:responseObject];
        
        [_collectionView reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",[error localizedDescription]);
    }];
    
    [manager GET:maoyanWillAppearHttp parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        _trailerModel = [[TrailerModel alloc] init];
        
        [_trailerModel initWithDict:responseObject];
        
        [_collectionViewTwo reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",[error localizedDescription]);
    }];
}

@end
