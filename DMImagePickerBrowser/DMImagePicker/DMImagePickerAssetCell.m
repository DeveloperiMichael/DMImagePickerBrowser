//
//  DMImagePickerCollectionViewCell.m
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/6.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "DMImagePickerAssetCell.h"
#import <Masonry/Masonry.h>
@interface DMImagePickerAssetCell()

@property (nonatomic, strong) UIImageView *selectImageView;

@property (nonatomic, strong) UIButton *selectButton;

@property (nonatomic, strong) UIImageView *contentImageView;

@end

@implementation DMImagePickerAssetCell

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





#pragma mark-
#pragma mark- Event response

- (void)selectButtonAction:(UIButton *)button {
    _selectButton.selected = !_selectButton.selected;
    if (_selectButton.selected) {
        _selectImageView.image = [UIImage imageNamed:@"select"];
    }else{
        _selectImageView.image = [UIImage imageNamed:@"unselect"];
    }
}


#pragma mark-
#pragma mark- Private Methods




#pragma mark-
#pragma mark- Getters && Setters

- (UIImageView *)contentImageView {
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc] init];
        int a = arc4random()%255;
        int b = arc4random()%255;
        int c = arc4random()%255;
        _contentImageView.backgroundColor = [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:1.0];
    }
    return _contentImageView;
}

- (UIButton *)selectButton {
    if (!_selectButton) {
        _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectButton.selected = NO;
        [_selectButton addTarget:self action:@selector(selectButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectButton;
}

- (UIImageView *)selectImageView {
    if (!_selectImageView) {
        _selectImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"unselect"]];
    }
    return _selectImageView;
}

#pragma mark-
#pragma mark- SetupConstraints

- (void)setupSubviewsContraints{
    [self.contentView addSubview:self.contentImageView];
    [self.contentView addSubview:self.selectButton];
    [self.contentView addSubview:self.selectImageView];
    
    [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
    [_selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.mas_equalTo(self.contentView);
        make.height.width.mas_equalTo(self.contentView.frame.size.width*0.4);
    }];
    [_selectImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).mas_offset(2.5);
        make.right.mas_equalTo(self.contentView).mas_offset(-2.5);
        make.height.width.mas_equalTo(self.contentView.frame.size.width*0.25);
    }];
}


@end
