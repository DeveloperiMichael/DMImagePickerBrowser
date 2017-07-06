//
//  DMImagePickerView.h
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/6.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

@interface DMImagePickerView : UIView


/**
 导航栏标题文字
 */
@property (nonatomic, copy) NSString *navTitle;


/**
 列数
 */
@property (nonatomic, assign) NSInteger columnNumber;

@end


@interface DMImagePickerCollectionView : UICollectionView


@end
