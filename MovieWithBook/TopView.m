//
//  TopView.m
//  MovieWithBook
//
//  Created by 13110100307 on 16/9/5.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "TopView.h"

@implementation TopView

-(instancetype)init {
    if (self = [super init]) {
        
        _model = [[topModel alloc] init];
        
        self.frame = [UIScreen mainScreen].bounds;
        
        self.backgroundColor = [UIColor colorWithHex:primary_color_0];
        
        [self addSubview:self.collectionView];
        
        [self getHttp];

        [self refresh];
        
        //删除字符串步骤
        //        NSString *str = @"adcfhaioslhdaous1234ahiosfhios";
        //
        //        NSString *removestr =@"1234";
        //
        //        NSArray *rawFields = [str componentsSeparatedByString:@"1234"];
        //
        //        NSMutableArray *fields = [NSMutableArray arrayWithArray:rawFields];
        //
        //        //Remove '[' from the first field
        //        NSString* firstRawField = [rawFields[0] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        //        if([firstRawField hasPrefix:@"4"] && [firstRawField length] > 1){
        //            [fields replaceObjectAtIndex:0 withObject:[firstRawField substringFromIndex:1]];
        //        }
        //
        //        //Remove ']' from the last field
        //        NSString* lastRawField = [rawFields[rawFields.count - 1] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        //        if([lastRawField hasSuffix:@"1"] && [lastRawField length] > 1){
        //            [fields replaceObjectAtIndex:(rawFields.count - 1) withObject:[lastRawField substringToIndex:[lastRawField length] - 1]];
        //        }
        

    }
    
    return self;
}


-(void)refresh {
    //下拉刷新
    _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getHttp];
        
        
        [_collectionView reloadData];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [_collectionView.mj_header endRefreshing];
        });
    }];
    
    //上拉刷新
    _collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [_collectionView.mj_footer endRefreshing];
    }];
}

-(UIScrollView *)verticalView {
    if (!_verticalView) {
        _verticalView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight)];
        _verticalView.pagingEnabled = YES;  //开启分页
        _verticalView.scrollEnabled = YES;
        _verticalView.canCancelContentTouches = NO;
        _verticalView.showsVerticalScrollIndicator = NO;  //水平滚动条
        _verticalView.backgroundColor = [UIColor colorWithHex:primary_color_0];
        _verticalView.bounces = NO;
        
        
        [_verticalView setContentSize:CGSizeMake(0, ScreenHeight + 64)];
        
        [_verticalView addSubview:self.collectionView];
        
        

    }
    
    return _verticalView;
}

-(UICollectionView *)collectionView {
    UICollectionViewFlowLayout *flowLaout = [[UICollectionViewFlowLayout alloc] init];
    [flowLaout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLaout.minimumInteritemSpacing = 0.0;
    
    _collectionView= [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 50) collectionViewLayout:flowLaout];
    
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
    
    self.cellDidSelectAction(indexPath.row);
    
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


-(void)getHttp {
    
    refreshActivityIndicatorView *refreshView = [[refreshActivityIndicatorView alloc] init];
    
    [self addSubview:refreshView];
    
    [refreshView startAnimating];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];

    [manager GET:topFilmHttp parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [refreshView stopAnimating];
        
        [_model initWithDict:responseObject];
        
        [_collectionView reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",[error localizedDescription]);
        
        [refreshView stopAnimating];

    }];
}



@end
