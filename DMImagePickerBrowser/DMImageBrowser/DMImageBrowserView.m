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

static NSString *const kImageCollectionViewCellIdentifier = @"DMImageBrowserCollectionViewCell";

@interface DMImageBrowserView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UIView *navigationView;

@property (nonatomic, strong) UIButton *leftButton;

@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) UICollectionView *collection;

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
    return 30;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DMImageBrowserCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kImageCollectionViewCellIdentifier forIndexPath:indexPath];
    
    return cell;
}



#pragma mark-
#pragma mark- Event response




#pragma mark-
#pragma mark- Private Methods

- (void)backButtonAction:(UIButton *)button {
    
}

- (void)selectButtonAction:(UIButton *)button {
    
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
        layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width+20, [UIScreen mainScreen].bounds.size.width);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collection.backgroundColor = [UIColor whiteColor];
        _collection.pagingEnabled = YES;
        _collection.showsHorizontalScrollIndicator = NO;
        _collection.bounces = NO;
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
        make.edges.mas_equalTo(self);
    }];
    [_navigationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self);
        make.height.mas_equalTo(64);
    }];
    [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.navigationView).mas_offset(15);
        make.top.mas_equalTo(self.navigationView).mas_equalTo(20);
        make.bottom.mas_equalTo(self.navigationView);
    }];
    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.navigationView).mas_offset(-15);
        make.centerY.mas_equalTo(_leftButton);
        make.width.mas_equalTo(24);
        make.height.mas_equalTo(24);
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
