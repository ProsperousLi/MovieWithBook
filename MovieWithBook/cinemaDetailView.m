//
//  cinemaDetailView.m
//  MovieWithBook
//
//  Created by dragon on 16/10/22.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "cinemaDetailView.h"

@implementation cinemaDetailView

-(instancetype)init {
    
    if (self = [super init]) {
        
        _model = [[cinemaDetailModel alloc] init];
        
        //[self getHttp];
        
        self.frame = [UIScreen mainScreen].bounds;
        
        self.backgroundColor = [UIColor colorWithHex:primary_color_0];
        
        [self addSubview:self.backgroudView];
        
        [self addSubview:self.informationView];
     
        [self  addSubview:self.tableView];
       // [self addSubview:self.tableView];
    }
    
    return self;
}


-(UIView *)backgroudView {
    
    if (!_backgroudView) {
        
        _backgroudView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight/3)];
        
        _backgroudView.backgroundColor = [UIColor clearColor];
        
        [_backgroudView addSubview:self.collectionView];
    }
    
    return _backgroudView;
}

-(UIView *)informationView {
    if (!_informationView) {
        _informationView = [[UILabel alloc] initWithFrame:CGRectMake(0, ScreenHeight/3 + 64, ScreenWidth, ScreenHeight/3)];
        
        _informationView.backgroundColor = [UIColor clearColor];
        
        [_informationView addSubview:self.movie_nameLabel];
        
        [_informationView addSubview:self.sorceLabel];
        
        [_informationView addSubview:self.information];

    }
    
    return _informationView;
}

-(UILabel *)movie_nameLabel {
    if (!_movie_nameLabel) {
        _movie_nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_informationView.frame.size.width/5, 0, _informationView.frame.size.width/2, _informationView.frame.size.height/4)];
        
        _movie_nameLabel.text = @"影名";
        
        [_movie_nameLabel setTextAlignment:NSTextAlignmentCenter];
    }
    
    return _movie_nameLabel;
}

-(UILabel *)sorceLabel {
    if (!_sorceLabel) {
        _sorceLabel = [[UILabel alloc] initWithFrame:CGRectMake(_informationView.frame.size.width/3 + _informationView.frame.size.width/2.5, 0, ScreenWidth/5,  _informationView.frame.size.height/4)];
        
        _sorceLabel.text = @"评分";
        
        _sorceLabel.font = [UIFont systemFontOfSize:11];
        
        _sorceLabel.textColor = [UIColor orangeColor];
    }
    return _sorceLabel;
}

-(UILabel *)information {
    if (!_information) {
        _information = [[UILabel alloc] initWithFrame:CGRectMake(0, _informationView.frame.size.height/3, ScreenWidth, _informationView.frame.size.height/5)];
        
        _information.backgroundColor = [UIColor clearColor];
        
        _information.font = [UIFont systemFontOfSize:11];
        
        [_information setTextAlignment:NSTextAlignmentCenter];
        
        _information.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
    }
    return _information;
}


-(UICollectionView *)collectionView {
    UICollectionViewFlowLayout *flowLaout = [[UICollectionViewFlowLayout alloc] init];
    [flowLaout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    flowLaout.minimumInteritemSpacing = 0.0;
    
    _collectionView= [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0,_backgroudView.frame.size.width,_backgroudView.frame.size.height) collectionViewLayout:flowLaout];
    
    _collectionView.bounces = YES;
    _collectionView.delegate =self;
    _collectionView.dataSource = self;
    
    _collectionView.showsHorizontalScrollIndicator = false;
    
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
    
    UIImageView* view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth/(3.5), ScreenHeight/4)];
    
    [view sd_setImageWithURL:[NSURL URLWithString:[_model.movieImage[0] objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    [cell.contentView addSubview:view];
    
    
    return cell;
}

//每个部分几个cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //NSLog(@"%lu",(unsigned long)[_model.movieImage count]);
    
    return [_model.movieImage[0] count];
}

//有几个部分section
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return CGSizeMake(ScreenWidth/(3.5), ScreenHeight/4);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, ScreenWidth/60, ScreenWidth/120, 0);
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    _movie_nameLabel.text = [_model.movieName[0] objectAtIndex:indexPath.row];
    
    
    _sorceLabel.text = [NSString stringWithFormat:@"%@分",[_model.movieScore[0] objectAtIndex:indexPath.row]];
    
    _information.text = [NSString stringWithFormat:@"%@ 分钟| %@ | %@",_model.movieLenght[0][indexPath.row],_model.movieTags[0][indexPath.row],_model.movieStarring[0][indexPath.row]];
    //NSLog(@"第%ld个cell被点击",(long)indexPath.row);
    
    //self.cellDidSelectAction(indexPath.row);
    
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}



//-(void)getHttp {
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    
//    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
//    
//    [manager GET:[NSURL URLWithString:cinemaDataLocationHttp] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        [_model initWithDict:responseObject];
//        
//        [self update];
//        
//        
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",[error localizedDescription]);
//    }];
//}


-(void)update {
    
    _movie_nameLabel.text = [_model.movieName[0] objectAtIndex:0];
    
    
    _sorceLabel.text = [NSString stringWithFormat:@"%@分",[_model.movieScore[0] objectAtIndex:0]];
    
    _information.text = [NSString stringWithFormat:@"%@ 分钟| %@ | %@",_model.movieLenght[0][0],_model.movieTags[0][0],_model.movieStarring[0][0]];
    
    
    [_collectionView reloadData];
    
    //NSLog(@"%@",[_model.movie[0][0] valueForKeyPath:@"time_table"] );
    
    [_tableView reloadData];
    //[_tableView reloadData];
    
}



-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, ScreenHeight/1.7, ScreenWidth, ScreenHeight - ScreenHeight/1.7)];
        _tableView.backgroundColor = [UIColor colorWithHex:primary_color_0];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *Cellidentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:Cellidentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cellidentifier];
        
        cell.backgroundColor = [UIColor clearColor];
        
        UILabel *timeLable = [[UILabel alloc] initWithFrame:CGRectMake(0, ScreenHeight/80, ScreenWidth/6, ScreenHeight/20)];
        
        timeLable.backgroundColor = [UIColor clearColor];
        
        timeLable.text = [NSString stringWithFormat:@"%@",[[_model.movie[0][0] valueForKeyPath:@"time_table.time"] objectAtIndex:indexPath.row]] ;
        
        [cell.contentView addSubview:timeLable];
        
        
        UILabel *typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/5, ScreenHeight/40, ScreenWidth/2, ScreenHeight/20)];
        
        typeLabel.backgroundColor = [UIColor clearColor];
        
        typeLabel.text = [NSString stringWithFormat:@"%@",[_model.movie[0][0] valueForKeyPath:@"movie_type"]];
        
        [cell.contentView addSubview:typeLabel];

        
        
        UIButton *buyButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/4 + ScreenWidth/2, ScreenHeight/40, ScreenWidth - (ScreenWidth/4 + ScreenWidth/2), ScreenHeight/20)];
        
        buyButton.tag = indexPath.row;
        
        buyButton.backgroundColor  = [UIColor colorWithHex:primary_color_500_mask];
        
        [buyButton setTitle:@"选 座 购 票" forState:UIControlStateNormal];
        
        
        [buyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [buyButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
        
        [buyButton addTarget:self action:@selector(buyAction:) forControlEvents:UIControlEventTouchUpInside];

        [cell.contentView addSubview:buyButton];
        
        //NSLog(@"moview type:%@",_DetailView.model.movieType);
        
    }
    
    
    return cell;
}


-(void)buyAction:(UIButton *)sender {
    self.cellDidSelectAction(sender.tag);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[_model.movie[0][0] valueForKeyPath:@"time_table.time"] count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *myCell=[self tableView:tableView cellForRowAtIndexPath:indexPath];//获取当前indexPath中的cell实例
    myCell.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight/9);
    
    return myCell.frame.size.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.cellDidSelectAction(indexPath.row);
    
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.5f];
}


- (void)deselect
{
    [_tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:YES];
}




@end
