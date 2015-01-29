//
//  SideMenuTableViewController.m
//  DrawerDemo
//
//  Created by chuguangming on 15/1/29.
//  Copyright (c) 2015年 chu. All rights reserved.
//

#import "SideMenuTableViewController.h"
#import "M13BadgeView.h"
#import "HomeViewController.h"
#import "SideMenuCell.h"
#import "SideMenuTableViewHeader.h"
#import "UIColor+Base.h"
#import "UIFont+Base.h"
#import "UIView+Base.h"
NSString * const SideMenuCellReuseIdentifier = @"SideMenuCell";
NSString * const SideDrawerHeaderReuseIdentifier = @"SideMenuTableViewHeader";

@interface SideMenuTableViewController ()
@property (nonatomic) UIViewController *hallPaneViewController;

@property (nonatomic) M13BadgeView *messageBadgeView;

@property (nonatomic, strong) NSDictionary *paneViewControllerTitles;

@property (nonatomic, strong) NSDictionary *paneViewControllerClasses;
@property (nonatomic, strong) NSDictionary *paneViewControllerImages;

@property (nonatomic, strong) NSDictionary *sectionTitles;

@property (nonatomic, strong) UIBarButtonItem *paneStateBarButtonItem;
@property (nonatomic, strong) UIBarButtonItem *paneRevealLeftBarButtonItem;
@property (nonatomic, strong) UIBarButtonItem *paneRevealRightBarButtonItem;
@end

@implementation SideMenuTableViewController
-(instancetype)init
{
    self=[super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)loadView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.rowHeight = 60;
    //去掉边框线
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[SideMenuCell class] forCellReuseIdentifier:SideMenuCellReuseIdentifier];
    [self.tableView registerClass:[SideMenuTableViewHeader class] forHeaderFooterViewReuseIdentifier:SideDrawerHeaderReuseIdentifier];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorColor = [UIColor colorWithWhite:1.0 alpha:0.25];
    
    
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if(section == 0){
        return 3;
    }else{
        return 1;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    float adjustHeight = ([UIView globalHeight]<470)?280:330;
    if (section == 0) {
        UIView *sectionView = [[UIView alloc]init];
        UIImageView *headerImg=[[UIImageView alloc]initWithFrame:CGRectMake(85.0, 0, 110, 110)];
        headerImg.center = CGPointMake(130, ([UIView globalHeight]-adjustHeight)*0.5);
        [headerImg setBackgroundColor:[UIColor whiteColor]];
        [headerImg setContentMode:UIViewContentModeScaleAspectFill];
        [headerImg setClipsToBounds:YES];
        CALayer *layer = [headerImg layer];
        layer.cornerRadius = headerImg.frame.size.height/2;
        
        [sectionView addSubview:headerImg];
        
        return sectionView;
    }else{
        UITableViewHeaderFooterView *headerView = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:SideDrawerHeaderReuseIdentifier];
        return headerView;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    float adjustHeight = ([UIView globalHeight]<470)?280:330;
    if (section == 0 ) {
        return [UIView globalHeight]-adjustHeight;
    }else if (section == 1){
        return ([UIView globalHeight]-adjustHeight)/5;
    }else{
        return FLT_EPSILON;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return FLT_EPSILON;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SideMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:SideMenuCellReuseIdentifier forIndexPath:indexPath];
    
    NSString *title = self.paneViewControllerTitles[@([self paneViewControllerTypeForIndexPath:indexPath])];
    NSString *imageName = self.paneViewControllerImages[@([self paneViewControllerTypeForIndexPath:indexPath])];
    [cell.sideCellImageView setImage:[UIImage imageNamed:imageName]];
    cell.sideCellLab.text = title;
    if ([title isEqualToString:@"消息"]) {
        _messageBadgeView = [[M13BadgeView alloc] initWithFrame:CGRectMake(0, 0, 18.0, 18.0)];
        _messageBadgeView.alignmentShift = CGSizeMake(20, 4);
        _messageBadgeView.font = [UIFont baseWithSize:13];
        _messageBadgeView.badgeBackgroundColor = [UIColor noodleYellow];
        _messageBadgeView.text = @"3";
        _messageBadgeView.hidesWhenZero = YES;
        [cell.sideCellImageView addSubview:_messageBadgeView];
    }
    return cell;
}
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PaneViewControllerType paneViewControllerType = [self paneViewControllerTypeForIndexPath:indexPath];
    [self transitionToViewController:paneViewControllerType];
    
    // Prevent visual display bug with cell dividers
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    double delayInSeconds = 0.3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.tableView reloadData];
    });
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - MSMenuViewController

- (void)initialize
{
    self.paneViewControllerType = NSUIntegerMax;
    self.paneViewControllerTitles = @{
                                      @(PaneViewControllerTypeMessage) : @"消息",
                                      @(PaneViewControllerTypeResume) : @"我的简历",
                                      @(PaneViewControllerTypeQuery) : @"考试记录",
                                      @(PaneViewControllerTypeSet) : @"设置",
                                      };
    
    self.paneViewControllerClasses = @{
                                       @(PaneViewControllerTypeResume) : [HomeViewController class],
                                       @(PaneViewControllerTypeQuery) : [HomeViewController class],
                                       @(PaneViewControllerTypeMessage) : [HomeViewController class],
                                       @(PaneViewControllerTypeSet) : [HomeViewController class],
                                       };
    self.paneViewControllerImages = @{
                                      @(PaneViewControllerTypeMessage) : @"Icon-Small-Message.png",
                                      @(PaneViewControllerTypeResume) : @"Icon-Small-SelfIntro.png",
                                      @(PaneViewControllerTypeQuery) : @"Icon-Small-Records.png",
                                      @(PaneViewControllerTypeSet) : @"Icon-Small-Setting.png"
                                      };
    
}

- (PaneViewControllerType)paneViewControllerTypeForIndexPath:(NSIndexPath *)indexPath
{
    PaneViewControllerType paneViewControllerType;
    if (indexPath.section == 0) {
        paneViewControllerType = indexPath.row;
    } else if (indexPath.section == 1) {
        paneViewControllerType = 3 + indexPath.row;
    }
    NSAssert(paneViewControllerType < PaneViewControllerTypeCount , @"Invalid Index Path");
    return paneViewControllerType;
}

- (void)transitionToViewController:(PaneViewControllerType)paneViewControllerType
{

    
}

- (void)performHall {
}


- (void)dynamicsDrawerRevealLeftBarButtonItemTapped:(id)sender
{
    [self.dynamicsDrawerViewController setPaneState:MSDynamicsDrawerPaneStateOpen inDirection:MSDynamicsDrawerDirectionLeft animated:YES allowUserInterruption:YES completion:nil];
}

@end
