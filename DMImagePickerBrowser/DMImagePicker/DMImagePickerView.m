//
//  DMImagePickerView.m
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/6.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "DMImagePickerView.h"
#import "UIFont+SAKitExtend.h"
#import "UIColor+SAKitExtend.h"
#import "DMImagePickerAssetCell.h"
#import "DMPhotoManager.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

static NSString *const kCollectionViewCellIdentifier = @"DMImagePickerAssetCell";

@interface DMImagePickerView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UIView *navigationView;

@property (nonatomic, strong) UIButton *leftButton;

@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) NSArray<DMAssetModel *> *assetModelArray;

@end

@implementation DMImagePickerView

#pragma mark-
#pragma mark- View Life Cycle

- (instancetype)initWithAssetModelArray:(NSArray *)array {
    self = [super init];
    if (self) {
        self.assetModelArray = array;
        _columnNumber = 4;
        [DMPhotoManager sharePhotoManager].columnNumber = _columnNumber;
        [self setupSubviewsContraints];
        
    }
    return self;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kScreenWidth).priorityHigh();
    }];
}

- (void)addConstraint:(NSLayoutConstraint *)constraint {
    if (constraint.firstAttribute == NSLayoutAttributeWidth) {
        constraint.constant = kScreenWidth;
    }
    [super addConstraint:constraint];
}

#pragma mark-
#pragma mark- delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.assetModelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DMImagePickerAssetCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewCellIdentifier forIndexPath:indexPath];
    cell.model = self.assetModelArray[indexPath.row];
    __weak typeof(cell) weakCell = cell;
   cell.didSelectPhotoBlock = ^(BOOL isSelected) {
       weakCell.model.isSelected = isSelected;
   };
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([_delegate respondsToSelector:@selector(didSelectItemAtIndexPath:collectionView:)]) {
        [_delegate didSelectItemAtIndexPath:indexPath collectionView:collectionView];
    }
}




#pragma mark-
#pragma mark- Event response

- (void)backButtonAction:(UIButton *)button {

    if ([_delegate respondsToSelector:@selector(backButtonClicked:)]) {
        [_delegate backButtonClicked:self];
    }
}

- (void)sureButtonAction:(UIButton *)button {
    if ([_delegate respondsToSelector:@selector(sureButtonClicked:)]) {
        [_delegate sureButtonClicked:self];
    }
}

#pragma mark-
#pragma mark- Private Methods





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
        [_leftButton setTitle:@"返回" forState:UIControlStateNormal];
        _leftButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [_leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_leftButton setTitleColor:[UIColor sa_colorC11] forState:UIControlStateNormal];
        [_leftButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton setTitle:@"确定" forState:UIControlStateNormal];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [_rightButton setTitleColor:[UIColor sa_colorC11] forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(sureButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont  fontWithName:@"Helvetica-Bold" size:17];
        _titleLabel.textColor = [UIColor sa_colorC11];
    }
    return _titleLabel;
}

- (DMImagePickerCollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat margin = 5;
        CGFloat itemWH = (kScreenWidth - (self.columnNumber + 1) * margin) / self.columnNumber;
        layout.itemSize = CGSizeMake(itemWH, itemWH);
        layout.minimumInteritemSpacing = margin;
        layout.minimumLineSpacing = margin;
        
        _collectionView = [[DMImagePickerCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.alwaysBounceHorizontal = NO;
        _collectionView.contentInset = UIEdgeInsetsMake(margin, margin, margin, margin);
        
        [_collectionView registerClass:[DMImagePickerAssetCell class] forCellWithReuseIdentifier:kCollectionViewCellIdentifier];
    }
    return _collectionView;
}

- (void)setNavTitle:(NSString *)navTitle {
    _titleLabel.text = navTitle;
}


- (NSArray<DMAssetModel *> *)assetModelArray {
    if (!_assetModelArray) {
        _assetModelArray = [NSMutableArray array];
    }
    return _assetModelArray;
}

#pragma mark-
#pragma mark- SetupConstraints

- (void)setupSubviewsContraints{
    [self addSubview:self.navigationView];
    [self.navigationView addSubview:self.leftButton];
    [self.navigationView addSubview:self.rightButton];
    [self.navigationView addSubview:self.titleLabel];
    [self addSubview:self.collectionView];
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
        make.top.bottom.mas_equalTo(_leftButton);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.navigationView).mas_equalTo(20);
        make.bottom.centerX.mas_equalTo(self.navigationView);
    }];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_navigationView.mas_bottom);
        make.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self).mas_offset(-50);
    }];
}


@end


@implementation DMImagePickerCollectionView



@end

