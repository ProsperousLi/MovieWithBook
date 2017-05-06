//
//  MoreInformationViewController.m
//  MovieWithBook
//
//  Created by dragon on 17/5/6.
//  Copyright © 2017年 13110100307. All rights reserved.
//

#import "MoreInformationViewController.h"

@interface MoreInformationViewController ()

@end

@implementation MoreInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.frame = [UIScreen mainScreen].bounds;
    
    self.view.backgroundColor =  [UIColor colorWithHex:primary_color_0];
    
    [_tableView reloadData];
    
    [self.view addSubview:self.tableView];
    
    
    NSLog(@"%lu",(unsigned long)[self.urlArray count]);
    
    refreshActivityIndicatorView *refreshView = [[refreshActivityIndicatorView alloc] init];
    
    [self.view addSubview:refreshView];
    
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [refreshView startAnimating];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [refreshView stopAnimating];
            
            [_tableView reloadData];
            
            [_tableView.mj_header endRefreshing];
        });
        
    }];
    

}


-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 44)];
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

    if (self.index == 1) {
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth - ScreenWidth/4, ScreenHeight/60, ScreenWidth/5, ScreenHeight/6)];
        
        //imageview.backgroundColor = [UIColor blackColor];
        
        [imageview sd_setImageWithURL:[NSURL URLWithString:[self.imageArray objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(ScreenWidth/20, 10, ScreenWidth/2 + ScreenWidth/10, ScreenHeight/15)];
        
        textView.backgroundColor = [UIColor clearColor];
        
        textView.textColor = [UIColor blackColor];
        
        textView.font = [UIFont systemFontOfSize:14];
        
        textView.font = [UIFont boldSystemFontOfSize:14.0f];
        
        textView.editable = NO;
        
        textView.selectable = NO;
        
        textView.userInteractionEnabled = NO;
        
        textView.text = [self.titleArray objectAtIndex:indexPath.row];
        
        
        
        UITextView *textViewInfo = [[UITextView alloc] initWithFrame:CGRectMake(ScreenWidth/20, 5 + ScreenHeight/15, ScreenWidth/2 + ScreenWidth/10, ScreenHeight/13)];
        
        textViewInfo.backgroundColor = [UIColor clearColor];
        
        textViewInfo.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
        
        textViewInfo.font = [UIFont systemFontOfSize:12];
        
        //textViewInfo.font = [UIFont boldSystemFontOfSize:14.0f];
        
        textViewInfo.editable = NO;
        
        textViewInfo.selectable = NO;
        
        textViewInfo.userInteractionEnabled = NO;
        
        textViewInfo.text = [self.contentArray objectAtIndex:indexPath.row];
        
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/20, ScreenHeight/5 - ScreenHeight/30, ScreenWidth/6, ScreenHeight/40)];
        
        nameLabel.text = [self.nickName objectAtIndex:indexPath.row];
        
        nameLabel.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
        
        nameLabel.font = [UIFont systemFontOfSize:12];
        
        
        UILabel *MoviewNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/20 + ScreenWidth/6, ScreenHeight/5 - ScreenHeight/30, ScreenWidth/3, ScreenHeight/40)];
        
        NSString *str = [NSString stringWithFormat:@"评论   %@",[self.movieName objectAtIndex:indexPath.row]];
        
        MoviewNameLabel.text = str;
        MoviewNameLabel.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
        
        MoviewNameLabel.font = [UIFont systemFontOfSize:12];
        
        [cell.contentView addSubview:imageview];
        
        [cell.contentView addSubview:textView];
        
        [cell.contentView addSubview:textViewInfo];
        
        [cell.contentView addSubview:nameLabel];
        
        [cell.contentView addSubview:MoviewNameLabel];
    }
    
    if (self.index == 2) {
        
        NSString *str = [self.numberImageViewArray objectAtIndex:indexPath.row];
        
        int number = [str intValue];
        //设置格式为3个view
        if (number >= 3) {
            for (int i =0; i < 3; i++) {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/20 +(ScreenWidth/50 + ScreenWidth/3- ScreenWidth/20) * i, ScreenHeight/16, ScreenWidth/3 - ScreenWidth/20, ScreenHeight/10)];
                [imageView sd_setImageWithURL:[[self.imageArray objectAtIndex:indexPath.row] objectAtIndex:i] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
                
                //imageView.backgroundColor = [UIColor blackColor];
                
                [cell.contentView addSubview:imageView];
                
                UILabel *ThreeImageLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, -10, ScreenWidth, ScreenHeight/10)];
                ThreeImageLabel.numberOfLines = 3;
                
                //ThreeImageLabel.text = [_newsModel.nameArray objectAtIndex:indexPath.row];
                
                ThreeImageLabel.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
                
                ThreeImageLabel.font = [UIFont systemFontOfSize:13.0f];
                
                ThreeImageLabel.backgroundColor = [UIColor clearColor];
                
                ThreeImageLabel.text = [NSString stringWithFormat:@"%@",[self.titleArray objectAtIndex:indexPath.row]];
                
                [cell.contentView addSubview:ThreeImageLabel];
                
            }
        }
        else { //设置为1个
            UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/20, ScreenHeight/60, ScreenWidth/3.1, ScreenHeight/7.5)];
            
            [imageview sd_setImageWithURL:[[self.imageArray objectAtIndex:indexPath.row] objectAtIndex:0] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
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
            
            textView.text = [NSString stringWithFormat:@"%@",[self.titleArray objectAtIndex:indexPath.row]];
            
            [cell.contentView addSubview:textView];
        }
        
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/20, ScreenHeight/5 - ScreenHeight/30, ScreenWidth/6, ScreenHeight/40)];
        
        if ([NSString stringWithFormat:@"%@",[self.nickName objectAtIndex:indexPath.row]] != [NSString stringWithFormat:@"%@",@"<null>"]) {
            
            //NSLog(@"%@",[NSString stringWithFormat:@"%@",[_newsModel.nickNameArray objectAtIndex:indexPath.row]] );
            nameLabel.text = [self.nickName objectAtIndex:indexPath.row];
        }
        else {
            nameLabel.text = @"侠名";
        }
        
        nameLabel.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
        
        nameLabel.font = [UIFont systemFontOfSize:12];
        
        [cell.contentView addSubview:nameLabel];
        
        UILabel *MoviewNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/20 + ScreenWidth/6, ScreenHeight/5 - ScreenHeight/30, ScreenWidth/3, ScreenHeight/40)];
        
        NSString *timeStr = [NSString stringWithFormat:@"%@",[self.titleArray objectAtIndex:indexPath.row]];
        
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

    
    
    cell.backgroundColor = [UIColor clearColor];
    
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.titleArray count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *myCell=[self tableView:tableView cellForRowAtIndexPath:indexPath];//获取当前indexPath中的cell实例

    myCell.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight/5);
    
    return myCell.frame.size.height;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _webVC = [[WebViewController alloc] init];
    
    if (self.index == 1) {
        _webVC.navigationItem.title = @"影评详情";
        
        

    }
    
    else if (self.index == 2) {
        _webVC.navigationItem.title = @"资讯详情";

    }
    
    _webVC.commentURL = [self.urlArray objectAtIndex:indexPath.row];

    [self.navigationController pushViewController:_webVC animated:YES];
    
    
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.2f];
}


- (void)deselect
{
    [_tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:YES];
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
