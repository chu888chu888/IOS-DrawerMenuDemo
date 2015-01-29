//
//  UILabel+Base.h
//  noodleBlue
//
//  Created by apple on 14/12/26.
//  Copyright (c) 2014年 noodles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Base)

- (CGSize)boundingRectWithSize:(CGSize)size;
+ (UILabel*) hintLableWithString:(NSString *)hintString;

@end
