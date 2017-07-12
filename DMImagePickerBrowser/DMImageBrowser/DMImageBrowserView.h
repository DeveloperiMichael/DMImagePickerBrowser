//
//  DMImageBrowserView.h
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/11.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DMImageBrowserView;
static NSString *const kImageCollectionViewCellIdentifier = @"DMImageBrowserCollectionViewCell";

@protocol DMImageBrowserViewDelegate <NSObject>

@required

- (NSInteger)imageBrowserView_collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;

- (__kindof UICollectionViewCell *)imageBrowserView_collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;


@optional

- (void)imageBrowserView_scrollViewDidScroll:(UIScrollView *)scrollView andCurrentIndex:(NSInteger)currentIndex;

- (void)backButtonClicked:(DMImageBrowserView *)view;

- (void)selectButtonClicked:(DMImageBrowserView *)view;

@end


@interface DMImageBrowserView : UIView

@property(nonatomic, assign) id<DMImageBrowserViewDelegate> delegate;

@property (nonatomic, strong) UICollectionView *collection;

@end
