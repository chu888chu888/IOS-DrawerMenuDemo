//
//  UIFont+Base.m
//  noodleBlue
//
//  Created by apple on 14/12/26.
//  Copyright (c) 2014年 noodles. All rights reserved.
//

#import "UIFont+Base.h"

@implementation UIFont (Base)

+ (UIFont *)baseWithSize:(float)size
{
    return [UIFont systemFontOfSize:size];
}

@end
