//
//  cinemaDetailViewController.m
//  MovieWithBook
//
//  Created by dragon on 16/10/22.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "cinemaDetailViewController.h"

@interface cinemaDetailViewController ()

@end

@implementation cinemaDetailViewController


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //self.navigationItem.title = _navagetionTitle;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _DetailView = [[cinemaDetailView alloc] init];

    [self.view addSubview:_DetailView];
    
    [self block];
    // Do any additional setup after loading the view.
}

-(void)block {
    __weak typeof (self)weakSelf = self;

    
    _DetailView.cellDidSelectAction = ^(NSInteger index) {
      
        weakSelf.chooseController = [[ChooseSeatViewController alloc] init];

        weakSelf.chooseController.item_title = weakSelf.DetailView.movie_nameLabel.text;
        
        weakSelf.chooseController.cinema_name = weakSelf.navagetionTitle;
        
        weakSelf.chooseController.type = [weakSelf.DetailView.model.movie[0][0] valueForKeyPath:@"movie_type"];
        
        [weakSelf.navigationController pushViewController:weakSelf.chooseController animated:YES];
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
