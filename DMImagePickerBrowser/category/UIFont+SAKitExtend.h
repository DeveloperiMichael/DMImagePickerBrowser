//
//  UIFont+SAKitExtend.h
//  SAKitDemo
//
//  Created by 詹学宝 on 2017/6/24.
//  Copyright © 2017年 浙江网仓科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SAFontBoldType){
    SAFontBoldTypeB1        =100,//常规字体
    SAFontBoldTypeB2,    //常规加粗
    SAFontBoldTypeB3  // 比加粗更粗
};

@interface UIFont (SAKitExtend)

/**
 *   54px  fontName 字体类型
 */
+ (UIFont *)sa_fontS1:(SAFontBoldType)fontName;
/**
 *   48px
 */
+ (UIFont *)sa_fontS2:(SAFontBoldType)fontName;
/**
 *  42px
 */
+ (UIFont *)sa_fontS3:(SAFontBoldType)fontName;
/**
 *  40px
 */
+ (UIFont *)sa_fontS4:(SAFontBoldType)fontName;
/**
 *  36px
 */
+ (UIFont *)sa_fontS5:(SAFontBoldType)fontName;
/**
 *  32px
 */
+ (UIFont *)sa_fontS6:(SAFontBoldType)fontName;
/**
 *  28px
 */
+ (UIFont *)sa_fontS7:(SAFontBoldType)fontName;
/**
 *  24px
 */
+ (UIFont *)sa_fontS8:(SAFontBoldType)fontName;
/**
 *  20px
 */
+ (UIFont *)sa_fontS9:(SAFontBoldType)fontName;

@end
