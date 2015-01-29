//
//  UIView+Base.h
//  noodleBlue
//
//  Created by apple on 14/12/26.
//  Copyright (c) 2014年 noodles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Base)

+ (float) globalWidth;
+ (float) globalHeight;

//设置 width / height

- (void)setWidth:(CGFloat)width height:(CGFloat)height;

- (void)setWidth:(CGFloat)width;

- (void)setHeight:(CGFloat)height;

//移动(修改位置)

- (void)moveHorizontal:(CGFloat)horizontal vertical:(CGFloat)vertical;

- (void)moveHorizontal:(CGFloat)horizontal vertical:(CGFloat)vertical addWidth:(CGFloat)widthAdded addHeight:(CGFloat)heightAdded;

- (void)moveToHorizontal:(CGFloat)horizontal toVertical:(CGFloat)vertical;

- (void)moveToHorizontal:(CGFloat)horizontal toVertical:(CGFloat)vertical setWidth:(CGFloat)width setHeight:(CGFloat)height;
@end
