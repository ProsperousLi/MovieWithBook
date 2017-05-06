//
//  FindView.m
//  MovieWithBook
//
//  Created by 13110100307 on 16/10/20.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "FindView.h"

@implementation FindView

-(instancetype)init {
    if (self = [super init]) {
        
        [self getHttp];
        
        _commentModel = [[CommentModel alloc] init];
        
        _newsModel = [[MovieNewsModel alloc] init];
        
        self.frame = [UIScreen mainScreen].bounds;
        
        self.backgroundColor =  [UIColor colorWithHex:primary_color_0];
        
        _CellArray = [[NSArray alloc] initWithObjects:@"Top 20",@"即将上映",@"影院票房排行",@"周边商城",nil];
        
        _CellImageArray = [[NSArray alloc] initWithObjects:@"goodMovie.png",@"will.png",@"piaofang.png",@"shopping.png" ,nil];
        
        [_tableView reloadData];
        
        [self addSubview:self.tableView];
        
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
                  
                [self getHttp];
                
                [_tableView reloadData];
                
                [_tableView.mj_header endRefreshing];
            });

        }];
        
    }
    
    return self;
}


-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 44 - 64)];
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
        
        
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:Cellidentifier];
        
    }
    else {
        //解决cell复用的问题
        while ([cell.contentView.subviews lastObject] !=nil) {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    
    if (indexPath.section <=0) {
        UILabel *timeLable = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/8, ScreenHeight/60, ScreenWidth/2, ScreenHeight/20)];
        
        timeLable.backgroundColor = [UIColor clearColor];
        
        timeLable.text = [_CellArray objectAtIndex:indexPath.row];
        
        [cell.contentView addSubview:timeLable];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth - ScreenWidth/3, ScreenHeight/60, ScreenWidth/8, ScreenHeight/15)];
        //imageView.backgroundColor = [UIColor blackColor];
        
        [imageView setImage:[UIImage imageNamed:[_CellImageArray objectAtIndex:indexPath.row]]];
        
        [cell.contentView addSubview:imageView];
    }
    else {
        
        if (indexPath.section == 1) {
            UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth - ScreenWidth/4, ScreenHeight/60, ScreenWidth/5, ScreenHeight/6)];
            
            //imageview.backgroundColor = [UIColor blackColor];
            
            [imageview sd_setImageWithURL:[NSURL URLWithString:[_commentModel.imageArray objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
            
            UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(ScreenWidth/20, 10, ScreenWidth/2 + ScreenWidth/10, ScreenHeight/15)];
            
            textView.backgroundColor = [UIColor clearColor];
            
            textView.textColor = [UIColor blackColor];
            
            textView.font = [UIFont systemFontOfSize:14];
            
            textView.font = [UIFont boldSystemFontOfSize:14.0f];
            
            textView.editable = NO;
            
            textView.selectable = NO;
            
            textView.userInteractionEnabled = NO;
            
            textView.text = [_commentModel.titleArray objectAtIndex:indexPath.row];
            
            
            
            UITextView *textViewInfo = [[UITextView alloc] initWithFrame:CGRectMake(ScreenWidth/20, 5 + ScreenHeight/15, ScreenWidth/2 + ScreenWidth/10, ScreenHeight/13)];
            
            textViewInfo.backgroundColor = [UIColor clearColor];
            
            textViewInfo.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
            
            textViewInfo.font = [UIFont systemFontOfSize:12];
            
            //textViewInfo.font = [UIFont boldSystemFontOfSize:14.0f];
            
            textViewInfo.editable = NO;
            
            textViewInfo.selectable = NO;
            
            textViewInfo.userInteractionEnabled = NO;
            
            textViewInfo.text = [_commentModel.contentArray objectAtIndex:indexPath.row];
            
            
            UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/20, ScreenHeight/5 - ScreenHeight/30, ScreenWidth/6, ScreenHeight/40)];
            
            nameLabel.text = [_commentModel.nameArray objectAtIndex:indexPath.row];
            
            nameLabel.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
            
            nameLabel.font = [UIFont systemFontOfSize:12];
            
            
            UILabel *MoviewNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/20 + ScreenWidth/6, ScreenHeight/5 - ScreenHeight/30, ScreenWidth/3, ScreenHeight/40)];
            
            NSString *str = [NSString stringWithFormat:@"评论   %@",[_commentModel.movieNameArray objectAtIndex:indexPath.row]];
            
            MoviewNameLabel.text = str;
            MoviewNameLabel.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
            
            MoviewNameLabel.font = [UIFont systemFontOfSize:12];
            
            [cell.contentView addSubview:imageview];
            
            [cell.contentView addSubview:textView];
            
            [cell.contentView addSubview:textViewInfo];
            
            [cell.contentView addSubview:nameLabel];
            
            [cell.contentView addSubview:MoviewNameLabel];
        }
        
        if (indexPath.section == 2) {
          
            NSString *str = [_newsModel.numberImageViewArray objectAtIndex:indexPath.row];
            
            int number = [str intValue];
            //设置格式为3个view
            if (number >= 3) {
                for (int i =0; i < 3; i++) {
                    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/20 +(ScreenWidth/50 + ScreenWidth/3- ScreenWidth/20) * i, ScreenHeight/16, ScreenWidth/3 - ScreenWidth/20, ScreenHeight/10)];
                     [imageView sd_setImageWithURL:[[_newsModel.picArray objectAtIndex:indexPath.row] objectAtIndex:i] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
                    
                    //imageView.backgroundColor = [UIColor blackColor];
                    
                    [cell.contentView addSubview:imageView];
                    
                    UILabel *ThreeImageLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, -10, ScreenWidth, ScreenHeight/10)];
                    ThreeImageLabel.numberOfLines = 3;
                    
                    //ThreeImageLabel.text = [_newsModel.nameArray objectAtIndex:indexPath.row];
                    
                    ThreeImageLabel.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
                    
                    ThreeImageLabel.font = [UIFont systemFontOfSize:13.0f];
                    
                    ThreeImageLabel.backgroundColor = [UIColor clearColor];
                    
                    ThreeImageLabel.text = [NSString stringWithFormat:@"%@",[_newsModel.titleArray objectAtIndex:indexPath.row]];
                    
                    [cell.contentView addSubview:ThreeImageLabel];

                }
            }
            else { //设置为1个
                UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/20, ScreenHeight/60, ScreenWidth/3.1, ScreenHeight/7.5)];
                
                [imageview sd_setImageWithURL:[[_newsModel.picArray objectAtIndex:indexPath.row] objectAtIndex:0] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
                //imageview.backgroundColor = [UIColor blackColor];

                [cell.contentView addSubview:imageview];
                
                
                UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(ScreenWidth/3 + ScreenWidth/10, ScreenHeight/60, ScreenWidth/2, ScreenHeight/8)];
                
                //textView.backgroundColor = [UIColor blackColor];
                
                textView.backgroundColor = [UIColor clearColor];
                
                textView.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
                
                //textView.font = [UIFont systemFontOfSize:12];
                
                textView.font = [UIFont boldSystemFontOfSize:14.0f];
                
                textView.editable = NO;
                
                textView.selectable = NO;
                
                textView.userInteractionEnabled = NO;
                
                textView.text = [NSString stringWithFormat:@"%@",[_newsModel.titleArray objectAtIndex:indexPath.row]];
                
                [cell.contentView addSubview:textView];
            }
            
            
            UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/20, ScreenHeight/5 - ScreenHeight/30, ScreenWidth/6, ScreenHeight/40)];
            
            if ([NSString stringWithFormat:@"%@",[_newsModel.nickNameArray objectAtIndex:indexPath.row]] != [NSString stringWithFormat:@"%@",@"<null>"]) {
                
                //NSLog(@"%@",[NSString stringWithFormat:@"%@",[_newsModel.nickNameArray objectAtIndex:indexPath.row]] );
                nameLabel.text = [_newsModel.nickNameArray objectAtIndex:indexPath.row];
            }
            else {
                nameLabel.text = @"侠名";
            }
            
            nameLabel.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
            
            nameLabel.font = [UIFont systemFontOfSize:12];
            
            [cell.contentView addSubview:nameLabel];

            UILabel *MoviewNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/20 + ScreenWidth/6, ScreenHeight/5 - ScreenHeight/30, ScreenWidth/3, ScreenHeight/40)];
            
            NSString *timeStr = [NSString stringWithFormat:@"%@",[_newsModel.titleArray objectAtIndex:indexPath.row]];
            
            //转化时间戳
            NSTimeInterval interval = [timeStr doubleValue] + 28800;
            
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
            
            [date description];
            
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            
            [format setDateFormat:@"MM-dd HH:mm"];
            
            
            NSString *dateStr = [NSString stringWithFormat:@" %@",[format stringFromDate:date]];
            
            MoviewNameLabel.text = dateStr;
            MoviewNameLabel.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
            
            MoviewNameLabel.font = [UIFont systemFontOfSize:12];
            
            [cell.contentView addSubview:MoviewNameLabel];

        }
        


    }
    
    
    cell.backgroundColor = [UIColor clearColor];
    
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 2) {
        return 5;
    }
    
    return [_CellArray count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return @"最受欢迎的影评";
    }
    if (section == 2) {
        return @"最新电影资讯";
    }
    
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *myCell=[self tableView:tableView cellForRowAtIndexPath:indexPath];//获取当前indexPath中的cell实例
    
    if (indexPath.section == 0) {
        myCell.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight/10);
    }
    
    else {
        myCell.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight/5);
    }
    
    
    
    return myCell.frame.size.height;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        self.cellDidSelectAction(indexPath.row,_CellArray);
    }
    
    if (indexPath.section == 1) {
        self.commentDetailAction(indexPath.row,_commentModel.commentURL);
    }
    
    if (indexPath.section == 2) {
        NSString *url = [NSString stringWithFormat:@"%@",[_newsModel.targetIdArray objectAtIndex:indexPath.row]];
        
       // NSLog(@"资讯网址：%@",url);
        self.NewsAction(url);
    }
    
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.2f];
}


- (void)deselect
{
    [_tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:YES];
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return _tableView.sectionFooterHeight;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 1) {
        
    }
    
    return 0;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return  _tableView.sectionHeaderHeight;
    }
    
    if (section == 2) {
        return  _tableView.sectionHeaderHeight;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        UIView *MoviewCommentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _tableView.frame.size.width, _tableView.sectionHeaderHeight)];
        
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(_tableView.frame.size.width/15, ScreenHeight/80, _tableView.frame.size.width/3, ScreenHeight/80)];
        
        lable.text = @"最受欢迎影评";
        
        lable.textColor = [UIColor blackColor];
        
        [MoviewCommentView addSubview:lable];
        
        UIButton *moreButton = [[UIButton alloc] initWithFrame:CGRectMake(_tableView.frame.size.width- _tableView.frame.size.width/5,  ScreenHeight/80, _tableView.frame.size.width/10, ScreenHeight/80)];
        
        [moreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [moreButton setTitle:@"更多" forState:UIControlStateNormal];
        
        moreButton.tag = 1;
        
        [moreButton addTarget:self action:@selector(moreAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [MoviewCommentView addSubview:moreButton];
        
        MoviewCommentView.backgroundColor = [UIColor whiteColor];
        
        return MoviewCommentView;
    }
    
    if (section == 2) {
        UIView *inforView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _tableView.frame.size.width, _tableView.sectionHeaderHeight)];
        
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(_tableView.frame.size.width/15, ScreenHeight/80, _tableView.frame.size.width/3, ScreenHeight/80)];
        
        lable.text = @"最热资讯";
        
        lable.textColor = [UIColor blackColor];
        
        [inforView addSubview:lable];
        
        UIButton *moreButton = [[UIButton alloc] initWithFrame:CGRectMake(_tableView.frame.size.width- _tableView.frame.size.width/5,  ScreenHeight/80, _tableView.frame.size.width/10, ScreenHeight/80)];
        
        [moreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [moreButton setTitle:@"更多" forState:UIControlStateNormal];
        
        moreButton.tag = 2;
        
        [moreButton addTarget:self action:@selector(moreAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [inforView addSubview:moreButton];
        
        inforView.backgroundColor = [UIColor whiteColor];
        
        return inforView;

    }
    
    return nil;
}

-(void)moreAction :(UIButton *)sender {
    
    //热评
    if (sender.tag == 1) {
        self.moreAction(1);
    }
    
    //资讯
    if (sender.tag == 2) {
        self.moreAction(2);
    }
}


-(void) getHttp {
    
    refreshActivityIndicatorView *refreshView = [[refreshActivityIndicatorView alloc] init];
    
    [self addSubview:refreshView];
    
    [refreshView startAnimating];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    
    [manager GET:maoyanMovieInfo parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [refreshView stopAnimating];
        
        [_newsModel initWithDict:responseObject];
        
        [_tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",[error localizedDescription]);
    }];
}


@end
