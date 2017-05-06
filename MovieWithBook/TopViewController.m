//
//  TopViewController.m
//  MovieWithBook
//
//  Created by 13110100307 on 16/9/5.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "TopViewController.h"


@interface TopViewController ()

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _topview = [[TopView alloc] init];
    
    _detailView = [[DetailView alloc] init];
    
    [self.view addSubview:_topview];
    
    [self blockAction];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)blockAction {
    __weak typeof (self)weakSelf = self;
    
    
    
    _topview.cellDidSelectAction = ^(NSInteger index) {
       
        weakSelf.detailController = [[DetailViewController alloc] init];
        
        weakSelf.detailController.currentTitle = [weakSelf.topview.model.nameArray objectAtIndex:index];
        
        //weakSelf.detailController.largeImage = [weakSelf.topview.model.imageArray objectAtIndex:index];
        
        weakSelf.detailController.mediumImage = [weakSelf.topview.model.mediumImageArray objectAtIndex:index];
        
        weakSelf.detailController.average = [weakSelf.topview.model.average objectAtIndex:index];
        
        weakSelf.detailController.type = [weakSelf.topview.model.type objectAtIndex:index];
        
        weakSelf.detailController.castsName = [[weakSelf.topview.model.casts   objectAtIndex:index] valueForKeyPath:@"name"];
        
        weakSelf.detailController.castsImage = [[weakSelf.topview.model.casts objectAtIndex:index] valueForKeyPath:@"avatars.small"];

        
        weakSelf.detailController.dirctorName = [[weakSelf.topview.model.dirctor objectAtIndex:index] valueForKeyPath:@"name"];
        
        weakSelf.detailController.dirctorImage = [[weakSelf.topview.model.dirctor objectAtIndex:index] valueForKeyPath:@"avatars.small"];

        
        weakSelf.detailController.idItem = [weakSelf.topview.model.idInfomation objectAtIndex:index];
        
        
        [weakSelf.navigationController pushViewController:weakSelf.detailController animated:YES];
    };
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
