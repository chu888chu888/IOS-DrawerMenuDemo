//
//  SideMenuTableViewHeader.m
//  noodleBlue
//
//  Created by apple on 14/12/24.
//  Copyright (c) 2014年 noodles. All rights reserved.
//

#import "SideMenuTableViewHeader.h"
#import "UIColor+Base.h"

@implementation SideMenuTableViewHeader

#pragma mark - NSObject

+ (void)load
{
    id labelAppearance = [UILabel appearanceWhenContainedIn:[self class], nil];
    [labelAppearance setFont:[UIFont systemFontOfSize:13.0]];
    [labelAppearance setTextColor:[UIColor whiteColor]];
}

#pragma mark - UIView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *backgoundView = [UIView new];
        backgoundView.backgroundColor = [UIColor colorWithHexString:@"252524"];
        self.backgroundView = backgoundView;
    
    }
    return self;
}


@end
