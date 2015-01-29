//
//  SideMenuTableViewController.h
//  DrawerDemo
//
//  Created by chuguangming on 15/1/29.
//  Copyright (c) 2015年 chu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSDynamicsDrawerViewController.h"
#import "UIColor+Base.h"
typedef NS_ENUM(NSInteger, PaneViewControllerType)
{
    PaneViewControllerTypeMessage,
    PaneViewControllerTypeResume,
    PaneViewControllerTypeQuery,
    PaneViewControllerTypeSet,
    PaneViewControllerTypeCount
};
@interface SideMenuTableViewController : UITableViewController

@property (nonatomic, weak) MSDynamicsDrawerViewController *dynamicsDrawerViewController;
@property (nonatomic, assign) PaneViewControllerType paneViewControllerType;

- (void)performHall;
@end
