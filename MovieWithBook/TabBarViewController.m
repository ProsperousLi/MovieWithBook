//
//  TabBarViewController.m
//  MovieWithBook
//
//  Created by 13110100307 on 16/9/5.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "TabBarViewController.h"
#import "TopViewController.h"
#import "personalViewController.h"
#import "FindViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNumber * personID = @(1);
    
    NSNumber * ticketsId = @(1);
    
    NSString *image = @"personImage.jpg";
    
    NSString *name = @"小李广子龙";
    
    NSString *describe = @"神一样的男人";
    
    NSNumber * sex = @(0);
    
    NSString *city = @"南京";
    
    NSNumber * year = @(1995);
    
    NSNumber * month = @(10);
    
    NSNumber * day = @(11);
    
    Person *person = [[Person alloc] init];
    
    person.ID = personID;
    
    person.ticketID = ticketsId;
    
    person.name = name;
    
    person.image = image;
    
    person.describe = describe;
    
    person.sex = sex;
    
    person.city = city;
    
    person.year = year;
    
    person.month = month;
    
    person.day = day;
    

    [[DataBase sharedDataBase] addPerson:person];

    
    [[DataBase sharedDataBase] updatePerson:person];
    
    self.delegate = self;
    
    self.navigationItem.title = @"正在热映";
    
    [self addOtherControllerToTabBarController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)addOtherControllerToTabBarController {
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    TopViewController *topViewController = [[TopViewController alloc] init];
    
    topViewController.tabBarItem.title = @"电影";
    
    topViewController.tabBarItem.image = [UIImage imageNamed:@"movie.png"];
    
    [array addObject:topViewController];
    
    FindViewController *findViewController = [[FindViewController alloc] init];
    
    findViewController.tabBarItem.title = @"发现";
    
    findViewController.tabBarItem.image = [UIImage imageNamed:@"find.png"];
    
    [array addObject:findViewController];
    
    personalViewController *personalController = [[personalViewController alloc] init];
    
    personalController.tabBarItem.title = @"个人";
    
    personalController.tabBarItem.image = [UIImage imageNamed:@"person.png"];
    
    [array addObject:personalController];
    
    self.viewControllers = array;
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    int selectedIndex = (int)tabBarController.selectedIndex; //哪个按钮被点击了，返回索引;从0开始
    
    switch (selectedIndex) {
        case 0:
            viewController.tabBarController.navigationController.navigationBar.hidden = NO;
            viewController.tabBarController.navigationItem.title = @"正在热映";
            //viewController.tabBarController.navigationController.navigationBar.frame = CGRectMake(0, 0, ScreenWidth, 64);//iOS7对UINavigationBar的标准进行重新的定义,其高度可以延伸到状态栏.所以44+20的高度等于64.
            break;
        case 1:
            viewController.tabBarController.navigationController.navigationBar.hidden = NO;
            viewController.tabBarController.navigationItem.title = @"发现";
            //viewController.tabBarController.navigationController.navigationBar.frame = CGRectMake(0, 0, ScreenWidth, 64);//iOS7对UINavigationBar的标准进行重新的定义,其高度可以延伸到状态栏.所以44+20的高度等于64.
            break;
            
        case 2:
            viewController.tabBarController.navigationController.navigationBar.hidden = NO;
            viewController.tabBarController.navigationItem.title = @"个人信息";
            //viewController.tabBarController.navigationController.navigationBar.frame = CGRectMake(0, 0, ScreenWidth, 64);//iOS7对UINavigationBar的标准进行重新的定义,其高度可以延伸到状态栏.所以44+20的高度等于64.
            
        default:
            break;
    }
}




@end
