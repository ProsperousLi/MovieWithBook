//
//  AfterFindViewController.m
//  MovieWithBook
//
//  Created by dragon on 16/10/29.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "AfterFindViewController.h"

@interface AfterFindViewController ()

@end

@implementation AfterFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _model = [[AfterFindModel alloc] init];
    
    NSLog(@"%@",_navigationTitle);
    
    self.navigationItem.title = _navigationTitle;
    
    _afterView = [[AfterFindView alloc] init];
    
    [self.view addSubview:self.afterView];
    
    [self.view addSubview:self.collectionView];
    
    [self getHttp];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UICollectionView *)collectionView {
    UICollectionViewFlowLayout *flowLaout = [[UICollectionViewFlowLayout alloc] init];
    [flowLaout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLaout.minimumInteritemSpacing = 0.0;
    
    _collectionView= [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight -50) collectionViewLayout:flowLaout];
    
    _collectionView.bounces = YES;
    _collectionView.delegate =self;
    _collectionView.dataSource = self;
    
    //_collectionView.showsVerticalScrollIndicator = false;
    
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
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 2 * ScreenWidth/3, ScreenWidth/2 - ScreenWidth/100, ScreenWidth/10)];
    
    label.backgroundColor = [UIColor colorWithHex:primary_color_0];
    
    label.font = [UIFont systemFontOfSize:13];
    
    label.text = [_model.nameArray objectAtIndex:indexPath.row];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    UIImageView* view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth/2 - ScreenWidth/100, 2 * ScreenWidth/3 )];
    
    [view sd_setImageWithURL:[NSURL URLWithString:[_model.imageArray objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    
    
    [cell.contentView addSubview:view];
    
    [cell.contentView addSubview:label];
    
    return cell;
}

//每个部分几个cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_model.nameArray count];
}

//有几个部分section
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return CGSizeMake(ScreenWidth/2 - ScreenWidth/100, (2 * ScreenWidth/3 + ScreenWidth/10));
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(ScreenWidth/60, ScreenWidth/120, ScreenWidth/60, ScreenWidth/120);
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //NSLog(@"第%ld个cell被点击",(long)indexPath.row);
    
    //self.cellDidSelectAction(indexPath.row);
    
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
    
    [manager GET:Top20Http parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [refreshView stopAnimating];
        
        [_model initWithDict:responseObject];
        
        [_collectionView reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",[error localizedDescription]);
    }];
}


@end
