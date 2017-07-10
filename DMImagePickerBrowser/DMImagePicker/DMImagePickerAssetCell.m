//
//  DMImagePickerCollectionViewCell.m
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/6.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "DMImagePickerAssetCell.h"
#import <Masonry/Masonry.h>
#import "DMPhotoManager.h"
@interface DMImagePickerAssetCell()


@property (nonatomic, strong) UIImageView *selectImageView;

@property (nonatomic, strong) UIImageView *contentImageView;

@property (nonatomic, strong) UIView *maskView;

@property (nonatomic, assign) PHImageRequestID bigImageRequestID;

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
    button.selected = !button.selected;
    
//    if (self.didSelectPhotoBlock) {
//        self.didSelectPhotoBlock(sender.isSelected);
//    }
    self.selectImageView.image = button.isSelected ? [UIImage imageNamed:@"select"] : [UIImage imageNamed:@"unselect"];
    if (button.isSelected) {
//        [UIView showOscillatoryAnimationWithLayer:_contentImageView.layer type:TZOscillatoryAnimationToBigger];
        // 用户选中了该图片，提前获取一下大图
        [self fetchBigImage];
    } else { // 取消选中，取消大图的获取
        if (_bigImageRequestID) {
            [[PHImageManager defaultManager] cancelImageRequest:_bigImageRequestID];
        }
    }
    
    _maskView.hidden = !_selectButton.selected;
}


#pragma mark-
#pragma mark- Private Methods

- (void)fetchBigImage {
    _bigImageRequestID = [[DMPhotoManager sharePhotoManager] getPhotoWithAsset:_model.asset completion:^(UIImage *photo, NSDictionary *info, BOOL isDegraded) {
//        if (_progressView) {
//            [self hideProgressView];
//        }
    } progressHandler:^(double progress, NSError *error, BOOL *stop, NSDictionary *info) {
        if (_model.isSelected) {
//            progress = progress > 0.02 ? progress : 0.02;;
//            self.progressView.progress = progress;
//            self.progressView.hidden = NO;
//            self.imageView.alpha = 0.4;
        } else {
            *stop = YES;
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        }
    } networkAccessAllowed:YES];
}



#pragma mark-
#pragma mark- Getters && Setters

- (UIImageView *)contentImageView {
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc] init];
        _contentImageView.contentMode = UIViewContentModeScaleAspectFill;
        _contentImageView.clipsToBounds = YES;
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

- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [[UIView alloc] init];
        _maskView.hidden = YES;
        _maskView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    }
    return _maskView;
}

- (void)setModel:(DMAssetModel *)model {
    _model = model;
    if (iOS8Later) {
        self.representedAssetIdentifier = [[DMPhotoManager sharePhotoManager] getAssetIdentifier:model.asset];
    }
    PHImageRequestID imageRequestID = [[DMPhotoManager sharePhotoManager] getPhotoWithAsset:model.asset photoWidth:self.contentView.frame.size.width completion:^(UIImage *photo, NSDictionary *info, BOOL isDegraded) {
//        if (_progressView) {
//            self.progressView.hidden = YES;
//            self.imageView.alpha = 1.0;
//        }
        // Set the cell's thumbnail image if it's still showing the same asset.
        if (!iOS8Later) {
            self.contentImageView.image = photo; return;
        }
        if ([self.representedAssetIdentifier isEqualToString:[[DMPhotoManager sharePhotoManager] getAssetIdentifier:model.asset]]) {
            self.contentImageView.image = photo;
        } else {
            // NSLog(@"this cell is showing other asset");
            [[PHImageManager defaultManager] cancelImageRequest:self.imageRequestID];
        }
        if (!isDegraded) {
            self.imageRequestID = 0;
        }
    } progressHandler:nil networkAccessAllowed:NO];
    if (imageRequestID && self.imageRequestID && imageRequestID != self.imageRequestID) {
        [[PHImageManager defaultManager] cancelImageRequest:self.imageRequestID];
        // NSLog(@"cancelImageRequest %d",self.imageRequestID);
    }
    self.imageRequestID = imageRequestID;
    self.selectButton.selected = model.isSelected;
    self.selectImageView.image = self.selectButton.isSelected ? [UIImage imageNamed:@"select"] : [UIImage imageNamed:@"unselect"];
    self.type = (NSInteger)model.type;
    // 让宽度/高度小于 最小可选照片尺寸 的图片不能选中
    if (![[DMPhotoManager sharePhotoManager] isPhotoSelectableWithAsset:model.asset]) {
        if (_selectImageView.hidden == NO) {
            self.selectButton.hidden = YES;
            _selectImageView.hidden = YES;
        }
    }
    // 如果用户选中了该图片，提前获取一下大图
    if (model.isSelected) {
        [self fetchBigImage];
    }
}

- (void)setType:(DMAssetCellType)type {
    _type = type;
    if (type == DMAssetCellTypePhoto || type == DMAssetCellTypeLivePhoto || (type == DMAssetCellTypePhotoGif && !self.allowPickingGif)) {
        _selectImageView.hidden = NO;
        _selectButton.hidden = NO;
        //_bottomView.hidden = YES;
    } else { // Video of Gif
        _selectImageView.hidden = YES;
//        _selectPhotoButton.hidden = YES;
//        _bottomView.hidden = NO;
        if (type == DMAssetCellTypeVideo) {
            //self.timeLength.text = _model.timeLength;
//            self.videoImgView.hidden = NO;
//            _timeLength.tz_left = self.videoImgView.tz_right;
//            _timeLength.textAlignment = NSTextAlignmentRight;
        } else {
//            self.timeLength.text = @"GIF";
//            self.videoImgView.hidden = YES;
//            _timeLength.tz_left = 5;
//            _timeLength.textAlignment = NSTextAlignmentLeft;
        }
    }
}




#pragma mark-
#pragma mark- SetupConstraints

- (void)setupSubviewsContraints{
    [self.contentView addSubview:self.contentImageView];
    [self.contentView addSubview:self.maskView];
    [self.contentView addSubview:self.selectButton];
    [self.contentView addSubview:self.selectImageView];
    
    [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
    [_maskView mas_makeConstraints:^(MASConstraintMaker *make) {
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
