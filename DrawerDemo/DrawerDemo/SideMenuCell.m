//
//  SideMenuCell.m
//  noodleBlue
//
//  Created by apple on 14/12/24.
//  Copyright (c) 2014年 noodles. All rights reserved.
//

#import "SideMenuCell.h"
#import "UIColor+Base.h"

@implementation SideMenuCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.textLabel.textColor = [UIColor whiteColor];
        self.textLabel.font = [UIFont systemFontOfSize:18.0];
        //设置点击背景
        UIView *selectedBackgroundView = [UIView new];
        selectedBackgroundView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.25];
        self.selectedBackgroundView = selectedBackgroundView;
        [self addBottonLine];
        [self addCellItem];
       
    }
    return self;
}

//添加渐变线
-(void) addBottonLine {
    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake( 0, self.contentView.frame.size.height + 15, self.contentView.frame.size.width, 0.5)];
    //设置渐变
    CAGradientLayer *newShadow = [[CAGradientLayer alloc] init];
    newShadow.frame = CGRectMake(0, 0, bottomLine.frame.size.width, bottomLine.frame.size.height);;
    //添加渐变的颜色组合
    newShadow.colors = [NSArray arrayWithObjects:(id)[UIColor clearColor].CGColor,(id)[UIColor colorWithHexString:@"4c4c4c"].CGColor,(id)[UIColor clearColor].CGColor,nil];
    [newShadow setLocations:@[@0,@0.5,@1]];
    [newShadow setStartPoint:CGPointMake(0, 0)];
    [newShadow setEndPoint:CGPointMake(0.8, 0)];
    
    
    [bottomLine.layer addSublayer:newShadow];
    [self.contentView addSubview:bottomLine];
    
}

//添加每一个cell的布局
-(void) addCellItem {
    UIView *cellView = [[UIView alloc]initWithFrame:CGRectMake(60.0f, 15.0f, 150.0f, 30.0f)];
    //添加icon
    _sideCellImageView = [[UIImageView alloc]initWithFrame:CGRectMake(2.5f, 2.5f, 25.0f, 25.0f)];

    [cellView addSubview:_sideCellImageView];
    //添加标题
    _sideCellLab = [[UILabel alloc]initWithFrame:CGRectMake(37.0f, 0.0f, 110.0f, 30.0f)];
    _sideCellLab.textColor = [UIColor whiteColor];
    [cellView addSubview:_sideCellLab];
    [self.contentView addSubview:cellView];
}


@end
