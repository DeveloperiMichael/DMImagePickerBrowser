//
//  DMImagePickerView.h
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/6.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

@class DMImagePickerView;

@protocol DMImagePickerViewDelegate <NSObject>

- (void)backButtonClicked:(DMImagePickerView *)view;

- (void)sureButtonClicked:(DMImagePickerView *)view;

@end

@interface DMImagePickerView : UIView


- (instancetype)initWithAssetModelArray:(NSMutableArray *)array;

/**
 导航栏标题文字
 */
@property (nonatomic, copy) NSString *navTitle;


/**
 列数
 */
@property (nonatomic, assign) NSInteger columnNumber;

@property(nonatomic, assign) id<DMImagePickerViewDelegate> delegate;

@end




@interface DMImagePickerCollectionView : UICollectionView


@end
