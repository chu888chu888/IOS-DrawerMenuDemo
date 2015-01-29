//
//  UIButton+Base.m
//  noodleBlue
//
//  Created by apple on 15/1/7.
//  Copyright (c) 2015年 noodles. All rights reserved.
//

#import "UIButton+Base.h"
#import "UIView+Base.h"
#import "UIFont+Base.h"

@implementation UIButton (Base)

+ (UIButton *) baseButtonWithColor: (UIColor *)color andTitle:(NSString *)title{
    UIButton * baseButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, [UIView globalWidth] - 20, 44)];
    [baseButton setTitle:title forState:UIControlStateNormal];
    [baseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    baseButton.titleLabel.font = [UIFont baseWithSize:18];
    [baseButton.layer setCornerRadius:8.0];
    [baseButton setBackgroundColor:color];
    return baseButton;
}


@end
