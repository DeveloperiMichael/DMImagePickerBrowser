//
//  UIColor+SAKitExtend.m
//  SAKitDemo
//
//  Created by 詹学宝 on 2017/7/1.
//  Copyright © 2017年 浙江网仓科技有限公司. All rights reserved.
//

#import "UIColor+SAKitExtend.h"

@implementation UIColor (SAKitExtend)
+ (UIColor *)sa_colorC1{
    return [UIColor colorWithRed:9/255.0 green:113/255.0 blue:206/255.0 alpha:1];
}
+ (UIColor *)sa_colorC2{
    return [UIColor colorWithRed:255/255.0 green:164/255.0 blue:9/255.0 alpha:1];
}
+ (UIColor *)sa_colorC3{
    return [UIColor colorWithRed:255/255.0 green:145/255.0 blue:11/255.0 alpha:1];
}

+ (UIColor *)sa_colorC4{
    return [UIColor colorWithRed:255/255.0 green:31/255.0 blue:31/255.0 alpha:1];
}
+ (UIColor *)sa_colorC5{
    return [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
}
+ (UIColor *)sa_colorC6{
    return [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
}
+ (UIColor *)sa_colorC7{
    return [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
}
+ (UIColor *)sa_colorC8{
    return [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
}
+ (UIColor *)sa_colorC9{
    return [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1];
}
+ (UIColor *)sa_colorC10{
    return [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
}
+ (UIColor *)sa_colorC11{
    return [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1];
}
+ (UIColor *)sa_colorC12{
    return [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
}
+ (UIColor *)sa_colorC13{
    return [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1];
}
+ (UIColor *)sa_colorC14{
    return [UIColor colorWithRed:229/255.0 green:233/255.0 blue:238/255.0 alpha:1];
}
+ (UIColor *)sa_colorC1Cur{
    return [UIColor colorWithRed:8/255.0 green:105/255.0 blue:194/255.0 alpha:1];
}
+ (UIColor *)sa_colorC3Cur{
    return [UIColor colorWithRed:240/255.0 green:136/255.0 blue:10/255.0 alpha:1];
}

-(UIImage *)imageForConvert{
    CGRect rect=CGRectMake(0, 0, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *convertImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return convertImage;
}

@end
