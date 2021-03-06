//
//  DMImageBrowserView.m
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/11.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "DMImageBrowserView.h"
#import "UIColor+SAKitExtend.h"
#import "UIFont+SAKitExtend.h"
#import <Masonry/Masonry.h>
#import "DMImageBrowserCollectionViewCell.h"



@interface DMImageBrowserView()<UICollectionViewDelegate,UICollectionViewDataSource>

{
    NSInteger _currentIndex;
    NSInteger _collectionNumber;
}
@property (nonatomic, strong) UIView *navigationView;

@property (nonatomic, strong) UIButton *leftButton;

@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *bottomView;

@end

@implementation DMImageBrowserView

#pragma mark-
#pragma mark- View Life Cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviewsContraints];
    }
    return self;
}

#pragma mark-
#pragma mark- delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    _collectionNumber = [_delegate imageBrowserView_collectionView:collectionView numberOfItemsInSection:section];
    return _collectionNumber;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [_delegate imageBrowserView_collectionView:collectionView cellForItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell isKindOfClass:[DMImageBrowserCollectionViewCell class]]) {
        [(DMImageBrowserCollectionViewCell *)cell resetScrollZoomView];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell isKindOfClass:[DMImageBrowserCollectionViewCell class]]) {
        [(DMImageBrowserCollectionViewCell *)cell resetScrollZoomView];
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offSetWidth = scrollView.contentOffset.x;
    offSetWidth = offSetWidth +  (([UIScreen mainScreen].bounds.size.width + 20) * 0.5);
    
    NSInteger currentIndex = offSetWidth / ([UIScreen mainScreen].bounds.size.width + 20);
    
    if (currentIndex < _collectionNumber && _currentIndex != currentIndex) {
        _currentIndex = currentIndex;
        
        if ([_delegate respondsToSelector:@selector(imageBrowserView_scrollViewDidScroll:andCurrentIndex:)]) {
            [_delegate imageBrowserView_scrollViewDidScroll:scrollView andCurrentIndex:_currentIndex];
        }
        
    }
    
}

#pragma mark-
#pragma mark- Event response




#pragma mark-
#pragma mark- Private Methods

- (void)backButtonAction:(UIButton *)button {
    if ([_delegate respondsToSelector:@selector(backButtonClicked:)]) {
        [_delegate backButtonClicked:self];
    }
}

- (void)selectButtonAction:(UIButton *)button {
    if ([_delegate respondsToSelector:@selector(selectButtonClicked:)]) {
        [_delegate selectButtonClicked:self];
    }
}


#pragma mark-
#pragma mark- Getters && Setters

- (UIView *)navigationView {
    if (!_navigationView) {
        _navigationView = [[UIView alloc] init];
        _navigationView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.8];
    }
    return _navigationView;
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        _leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_leftButton setTitleColor:[UIColor sa_colorC11] forState:UIControlStateNormal];
        [_leftButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton setTitleColor:[UIColor sa_colorC11] forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(selectButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_rightButton setImage:[UIImage imageNamed:@"unselect"] forState:UIControlStateNormal];
        _rightButton.contentEdgeInsets = UIEdgeInsetsMake(8, 16, 8, 0);
    }
    return _rightButton;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.8];
    }
    return _bottomView;
}

- (UICollectionView *)collection {
    if (!_collection) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width+20, [UIScreen mainScreen].bounds.size.height);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collection.backgroundColor = [UIColor blackColor];
        _collection.pagingEnabled = YES;
        _collection.showsHorizontalScrollIndicator = NO;
        _collection.delegate = self;
        _collection.dataSource = self;
        [_collection registerClass:[DMImageBrowserCollectionViewCell class] forCellWithReuseIdentifier:kImageCollectionViewCellIdentifier];
    }
    return _collection;
}

#pragma mark-
#pragma mark- SetupConstraints

- (void)setupSubviewsContraints{
    [self addSubview:self.collection];
    [self addSubview:self.navigationView];
    [self.navigationView addSubview:self.leftButton];
    [self.navigationView addSubview:self.rightButton];
    [self addSubview:self.bottomView];
    [_collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self);
        make.left.mas_equalTo(self).mas_offset(-10);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width+20);
    }];
    [_navigationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self);
        make.height.mas_equalTo(64);
    }];
    [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.navigationView).mas_offset(15);
        make.width.mas_equalTo(40);
        make.top.mas_equalTo(self.navigationView).mas_equalTo(20);
        make.bottom.mas_equalTo(self.navigationView);
    }];
    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.navigationView).mas_offset(-15);
        make.centerY.mas_equalTo(_leftButton);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.navigationView).mas_equalTo(20);
        make.bottom.centerX.mas_equalTo(self.navigationView);
    }];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self);
        make.height.mas_equalTo(50);
    }];
    

}

@end
