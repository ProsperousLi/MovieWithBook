//
//  allTicketsView.h
//  MovieWithBook
//
//  Created by dragon on 16/11/7.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface allTicketsView : UIView <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

/**
 *  存储票的对象的数组
 */
@property (nonatomic,strong) NSMutableArray *ticketArray;

-(instancetype)init;

@end
