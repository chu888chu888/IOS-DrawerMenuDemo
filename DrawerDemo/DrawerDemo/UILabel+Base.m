//
//  UILabel+Base.m
//  noodleBlue
//
//  Created by apple on 14/12/26.
//  Copyright (c) 2014年 noodles. All rights reserved.
//

#import "UILabel+Base.h"
#import "UIView+Base.h"

@implementation UILabel (Base)

//获得uilabel中文本框文本的大小（高度和宽度）
- (CGSize)boundingRectWithSize:(CGSize)size
{
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    
    CGSize retSize = [self.text boundingRectWithSize:size
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize;
}

//统一提示语样式
+ (UILabel*) hintLableWithString:(NSString *)hintString {
    UILabel *hintLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, [UIView globalWidth] - 20, 44)];
    hintLab.text = hintString;
    hintLab.textColor = [UIColor lightGrayColor];
    return hintLab;
    
}

@end
