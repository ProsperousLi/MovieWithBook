//
//  ChooseSeatViewController.m
//  MovieWithBook
//
//  Created by 13110100307 on 16/10/27.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "ChooseSeatViewController.h"

@interface ChooseSeatViewController ()

@end

@implementation ChooseSeatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    //self.navigationItem.title = _item_title;
    
    _chooseView = [[ChooseSeatView alloc] init];
    
    [self.view addSubview:_chooseView];
    
    [self reveiceData];
    
    [self block];
}


-(void)reveiceData {
    _chooseView.cinema_nameLabel.text = self.movieName;
    
    _chooseView.typeLabel.text = [NSString stringWithFormat:@"类型:%@",self.movieType];
    
    _chooseView.beginTimeLabel.text =[NSString stringWithFormat:@"观影时间:%@",self.movieBeginTime];
    _chooseView.movieTimelabel.text = [NSString stringWithFormat:@"时长:%@",self.movieTime];
    
    _chooseView.priceLabel.text = [NSString stringWithFormat:@"价格:%@元/张",self.moviePrice];
    
    [_chooseView.imageView sd_setImageWithURL:[NSURL URLWithString:self.movieImageUrl] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];

}


-(void) block {
     __weak typeof (self)weakSelf = self;
    
    _chooseView.DidAction  = ^(void) {
        
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"提示" message:@"购买成功!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"好的", nil];
        
        [alertview show];

        for (int i = 0; i < [_chooseView.piaoPaiArray count]; i++) {
            Tickets *ticke = [[Tickets alloc] init];
            
            //ticke.own_id = @(i);
            
            ticke.movie = _movieName;
            
            ticke.cinemaName = self.navigationItem.title;

            
            ticke.numbserTickes = @(1);
            
            ticke.price = [_moviePrice integerValue];
            
            ticke.roomNumber = @(arc4random() %(10 - 1 + 1) + 1);
            
            ticke.pai = @([[_chooseView.piaoPaiArray objectAtIndex:i] integerValue]);
            
            ticke.zuo = @([[_chooseView.piaoZuoArray objectAtIndex:i] integerValue]);
            
            [[DataBase sharedDataBase] addTicket:ticke];
            
            //[[DataBase sharedDataBase] updateTicket:ticke];

        }
        
        [weakSelf.navigationController popToRootViewControllerAnimated:YES];

    };
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
