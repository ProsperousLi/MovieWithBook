//
//  allTicketsView.m
//  MovieWithBook
//
//  Created by dragon on 16/11/7.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "allTicketsView.h"

@implementation allTicketsView

-(instancetype)init {
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        
        self.backgroundColor = [UIColor colorWithHex:primary_color_0];
        
        _ticketArray = [[NSMutableArray alloc] init];
        
        _ticketArray = [[DataBase sharedDataBase] getAllTickets];
        
        [self addSubview:self.tableView];
        
        
        
        //NSLog(@"%@",[[DataBase sharedDataBase] getAllTickets]);
    }
    
    return self;
}



-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        _tableView.backgroundColor = [UIColor colorWithHex:primary_color_0];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Tickets *ticket = [[Tickets alloc] init];
    
    NSInteger lengthTicket = [_ticketArray count] -1;
    //倒序打印
    ticket = [_ticketArray objectAtIndex:lengthTicket - indexPath.row];
    
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
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/100, ScreenHeight/100, ScreenWidth, ScreenHeight/20)];
    lable.backgroundColor = [UIColor clearColor];
    
    lable.textColor = [UIColor colorWithHex:main_text_title_color_light];
    
    lable.text = ticket.cinemaName;
    
    lable.font = [UIFont systemFontOfSize:12];
    
    UILabel *movielabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/100, ScreenHeight/100 * 2 + ScreenHeight/20 , ScreenWidth, ScreenHeight/20)];
    
    movielabel.backgroundColor = [UIColor clearColor];
    
    movielabel.textColor = [UIColor colorWithHex:main_text_title_color_dark];
    
    movielabel.text = [NSString stringWithFormat:@"%@   %ld张",ticket.movie,(long)ticket.numbserTickes];
    
    //movielabel.font = [UIFont systemFontOfSize:12];
    
    UILabel *RoomLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/100, ScreenHeight/100 * 3 + ScreenHeight/20 * 2, ScreenWidth, ScreenHeight/20)];
    
    RoomLabel.backgroundColor = [UIColor clearColor];
    
    RoomLabel.textColor = [UIColor colorWithHex:main_text_title_color_light];
    
    RoomLabel.text = [NSString stringWithFormat:@"%ld 号厅   %ld排%ld座",(long)ticket.roomNumber,(long)ticket.pai,(long)ticket.zuo];
    
    RoomLabel.font = [UIFont systemFontOfSize:12];
    
    
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/100, ScreenHeight/100 * 4 + ScreenHeight/20 * 3, ScreenWidth, ScreenHeight/20)];
    
    priceLabel.backgroundColor = [UIColor clearColor];
    
    priceLabel.textColor = [UIColor colorWithHex:main_text_title_color_light];
    
    priceLabel.text = [NSString stringWithFormat:@"总价 ： %ld元",(long)ticket.price];
    
    priceLabel.font = [UIFont systemFontOfSize:12];
    
    [cell.contentView addSubview:lable];
    
    [cell.contentView addSubview:movielabel];
    
    [cell.contentView addSubview:RoomLabel];
    
    [cell.contentView addSubview:priceLabel];

    
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
    return [[[DataBase sharedDataBase] getAllTickets] count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *myCell=[self tableView:tableView cellForRowAtIndexPath:indexPath];//获取当前indexPath中的cell实例
    myCell.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight/4);
    
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
    
    //self.cellDidSelectAction(indexPath.row);
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.5f];
}


- (void)deselect
{
    [_tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Tickets *tic = [[Tickets alloc] init];
    
    tic = [_ticketArray objectAtIndex:indexPath.row];
    
    [_ticketArray removeObjectAtIndex:indexPath.row];
    
    [[DataBase sharedDataBase] deleteTicket:tic];
    
    [_tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return @"删除";
    
}


@end
