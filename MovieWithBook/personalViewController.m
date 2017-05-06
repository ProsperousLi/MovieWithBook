//
//  personalViewController.m
//  MovieWithBook
//
//  Created by 13110100307 on 16/9/5.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "personalViewController.h"

#import "allTicketsViewController.h"

@interface personalViewController ()

@end

@implementation personalViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [_personalTableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //NSLog(@"%@",[[DataBase sharedDataBase] getAllperson]);
    
    _persontwo = [[Person alloc] init];
    
    _persontwo = [[[DataBase sharedDataBase] getAllperson] objectAtIndex:0];
    
    
    _personView = [[personalView alloc] init];
    
    [self.view addSubview:_personView];
    
    [_personView addSubview:self.personalTableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableView *)personalTableView {
    if (!_personalTableView) {
        _personalTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        _personalTableView.backgroundColor = [UIColor colorWithHex:primary_color_0];
        
        _personalTableView.delegate = self;
        _personalTableView.dataSource = self;
    }
    
    return _personalTableView;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //读取数据库数据
    
    static NSString *Cellidentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:Cellidentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:Cellidentifier];
    }
    
    cell.backgroundColor = [UIColor colorWithHex:primary_color_grey_200];
    
    
    UILabel *userNameLable = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/10, ScreenHeight/48, ScreenWidth/2, ScreenHeight/24)];
    userNameLable.backgroundColor = [UIColor clearColor];
    
    userNameLable.textColor = [UIColor blackColor];
    
    //lable.text = [appDelegate.nameArray objectAtIndex:indexPath.row];
    
    //[cell.contentView addSubview:image];
    
    if (indexPath.row == 0) {
        
        userNameLable.text = _persontwo.name;
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth - ScreenWidth/3, ScreenHeight/100, ScreenWidth/4, ScreenHeight/12)];
        
        image.backgroundColor = [UIColor clearColor];
        
        
        [image setImage:[UIImage imageNamed:_persontwo.image]];
        
        [cell.contentView addSubview:image];
    }
    if (indexPath.row == 1) {
        if ([_persontwo.sex intValue] == 0) {
            userNameLable.text = @"纯爷们";
        }
        else if ([_persontwo.sex intValue] == 1) {
            userNameLable.text = @"小女人";
        }
        else  {
            NSLog(@"中性人");
        }
    }
    
    if (indexPath.row == 2) {
        userNameLable.text = _persontwo.describe;
    }
    
    if (indexPath.row == 3) {
        userNameLable.text = [NSString stringWithFormat:@"生日 : %@-%@-%@",_persontwo.year,_persontwo.month,_persontwo.day];
    }
    
    if (indexPath.row == 4) {
        userNameLable.text = @"我的电影票";
        cell.backgroundColor = [UIColor colorWithHex:primary_color_500_mask];
    }
    
    
    [cell.contentView addSubview:userNameLable];
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
     UITableViewCell *myCell=[self tableView:tableView cellForRowAtIndexPath:indexPath];//获取当前indexPath中的cell实例
    myCell.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight/12);
    
    if (indexPath.row == 0) {
        myCell.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight/10);
    }
    
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
    
    if (indexPath.row == 4) {
       // NSLog(@"进入我的电影票界面");
        
        
        allTicketsViewController * allVC= [[allTicketsViewController alloc] init];
        
        [self.navigationController pushViewController:allVC animated:YES];
        
        [self performSelector:@selector(deselect) withObject:nil afterDelay:0.3f];
    }

}


- (void)deselect
{
    [_personalTableView deselectRowAtIndexPath:[_personalTableView indexPathForSelectedRow] animated:YES];
}


@end
