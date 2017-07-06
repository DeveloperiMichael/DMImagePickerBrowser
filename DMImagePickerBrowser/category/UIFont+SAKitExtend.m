//
//  UIFont+SAKitExtend.m
//  SAKitDemo
//
//  Created by 詹学宝 on 2017/6/24.
//  Copyright © 2017年 浙江网仓科技有限公司. All rights reserved.
//

#import "UIFont+SAKitExtend.h"

static NSString *const kHelveticaNeueLightFont = @"HelveticaNeue-Light";
static NSString *const kHelveticaNeueFont       = @"HelveticaNeue";
static NSString *const kHelveticaNeueMediumFont = @"HelveticaNeue-Medium";
//static NSString *const kHelveticaNeueThinFont   = @"HelveticaNeue-Thin";
//static NSString *const kFuturaMediumFont        = @"Futura-Medium";
//static NSString *const kSanFranciscoFont = @"SanFrancisco";

@implementation UIFont (SAKitExtend)

+ (UIFont *)sa_fontS1:(SAFontBoldType)fontName{
    
    if (fontName == SAFontBoldTypeB1) {
        UIFont *font = [UIFont fontWithName:kHelveticaNeueLightFont size:27.0f];
        return font;
        
    }else if(fontName == SAFontBoldTypeB2){
        UIFont *font = [UIFont fontWithName:kHelveticaNeueFont size:27.0f];
        return font;
    }else{
        
        UIFont *font = [UIFont fontWithName:kHelveticaNeueMediumFont size:27.0f];
        return font;
    }
    return NULL;
}
+ (UIFont *)sa_fontS2:(SAFontBoldType)fontName{
    if (fontName == SAFontBoldTypeB2) {
        UIFont *font = [UIFont fontWithName:kHelveticaNeueFont size:24.0f];
        return font;
    }else if(fontName == SAFontBoldTypeB3){
        UIFont *font = [UIFont fontWithName:kHelveticaNeueMediumFont size:24.0f];
        return font;
    }else{
        UIFont *font = [UIFont fontWithName:kHelveticaNeueLightFont size:24.0f];
        return font;
    }
    return NULL;
}
+ (UIFont *)sa_fontS3:(SAFontBoldType)fontName{
    if (fontName == SAFontBoldTypeB2) {
        UIFont *font = [UIFont fontWithName:kHelveticaNeueFont size:21.0f];
        return font;
    }else if(fontName == SAFontBoldTypeB3){
        UIFont *font = [UIFont fontWithName:kHelveticaNeueMediumFont size:21.0f];
        return font;
    }else{
        UIFont *font = [UIFont fontWithName:kHelveticaNeueLightFont size:21.0f];
        return font;
    }
    return NULL;
}
+ (UIFont *)sa_fontS4:(SAFontBoldType)fontName{
    if (fontName == SAFontBoldTypeB2) {
        UIFont *font = [UIFont fontWithName:kHelveticaNeueFont size:20.0f];
        return font;
    }else if(fontName == SAFontBoldTypeB3){
        UIFont *font = [UIFont fontWithName:kHelveticaNeueMediumFont size:20.0f];
        return font;
    }else{
        UIFont *font = [UIFont fontWithName:kHelveticaNeueLightFont size:20.0f];
        return font;
    }
    return NULL;
}
+ (UIFont *)sa_fontS5:(SAFontBoldType)fontName{
    if (fontName == SAFontBoldTypeB2) {
        UIFont *font = [UIFont fontWithName:kHelveticaNeueFont size:18.0f];
        return font;
    }else if(fontName == SAFontBoldTypeB3){
        UIFont *font = [UIFont fontWithName:kHelveticaNeueMediumFont size:18.0f];
        return font;
    }else{
        UIFont *font = [UIFont fontWithName:kHelveticaNeueLightFont size:18.0f];
        return font;
    }
    return NULL;
}
+ (UIFont *)sa_fontS6:(SAFontBoldType)fontName{
    if (fontName == SAFontBoldTypeB2) {
        UIFont *font = [UIFont fontWithName:kHelveticaNeueFont size:16.0f];
        return font;
    }else if(fontName == SAFontBoldTypeB3){
        UIFont *font = [UIFont fontWithName:kHelveticaNeueMediumFont size:16.0f];
        return font;
    }else{
        UIFont *font = [UIFont fontWithName:kHelveticaNeueLightFont size:16.0f];
        return font;
    }
    return NULL;
}
+ (UIFont *)sa_fontS7:(SAFontBoldType)fontName{
    if (fontName == SAFontBoldTypeB2) {
        UIFont *font = [UIFont fontWithName:kHelveticaNeueFont size:14.0f];
        return font;
    }else if(fontName == SAFontBoldTypeB3){
        UIFont *font = [UIFont fontWithName:kHelveticaNeueMediumFont size:14.0f];
        return font;
    }else{
        UIFont *font = [UIFont fontWithName:kHelveticaNeueLightFont size:14.0f];
        return font;
    }
    return NULL;
}
+ (UIFont *)sa_fontS8:(SAFontBoldType)fontName{
    if (fontName == SAFontBoldTypeB2) {
        UIFont *font = [UIFont fontWithName:kHelveticaNeueFont size:12.0f];
        return font;
    }else if(fontName == SAFontBoldTypeB3){
        UIFont *font = [UIFont fontWithName:kHelveticaNeueMediumFont size:12.0f];
        return font;
    }else{
        UIFont *font = [UIFont fontWithName:kHelveticaNeueLightFont size:12.0f];
        return font;
    }
    return NULL;
}
+ (UIFont *)sa_fontS9:(SAFontBoldType)fontName{
    if (fontName == SAFontBoldTypeB2) {
        UIFont *font = [UIFont fontWithName:kHelveticaNeueFont size:10.0f];
        return font;
    }else if(fontName == SAFontBoldTypeB3){
        UIFont *font = [UIFont fontWithName:kHelveticaNeueMediumFont size:10.0f];
        return font;
    }else{
        UIFont *font = [UIFont fontWithName:kHelveticaNeueLightFont size:10.0f];
        return font;
    }
    return NULL;
}

@end
