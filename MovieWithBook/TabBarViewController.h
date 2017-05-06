//
//  TabBarViewController.h
//  MovieWithBook
//
//  Created by 13110100307 on 16/9/5.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarViewController : UITabBarController<UITabBarControllerDelegate>


/**
 *添加别的视图控制器到本视图控制器
 */
-(void)addOtherControllerToTabBarController;


@end
