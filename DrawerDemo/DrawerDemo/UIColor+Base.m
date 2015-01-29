//
//  UIColor+Base.m
//  noodleBlue
//
//  Created by apple on 15/1/6.
//  Copyright (c) 2015年 noodles. All rights reserved.
//

#import "UIColor+Base.h"

@implementation UIColor (Base)

/**
 *  根据十六进制颜色生成UIColor
 *
 *  @param color 十六进制颜色字符串
 *
 *  @return 返回UIColor
 */
+ (UIColor *) colorWithHexString: (NSString *)color{
    
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
    
}

+ (UIColor *) noodleLightGray {
    return [UIColor colorWithHexString:@"f8f8f8"];
}

+ (UIColor *) noodleGray {
    return [UIColor colorWithHexString:@"e9e9eb"];
}

+ (UIColor *) noodleBlack {
    return [UIColor colorWithHexString:@"252524"];
}

+ (UIColor *) noodleBlue {
    return [UIColor colorWithHexString:@"33bdf2"];
}

+ (UIColor *) noodleRed {
    return [UIColor colorWithHexString:@"ec4c47"];
}

+ (UIColor *) noodleYellow {
    return [UIColor colorWithHexString:@"f9ba48"];
}

+ (UIColor *) noodleBaseColor {
    return [UIColor noodleBlue];
}
@end
