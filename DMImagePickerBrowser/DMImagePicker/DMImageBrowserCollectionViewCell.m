//
//  DMImageBrowserCollectionViewCell.m
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/11.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "DMImageBrowserCollectionViewCell.h"
#import "UIColor+SAKitExtend.h"
#import "UIFont+SAKitExtend.h"
#import <Masonry/Masonry.h>
#import "DMPhotoManager.h"
@interface DMImageBrowserCollectionViewCell()

@property (nonatomic, strong) UIImageView *contentImageView;

@property (nonatomic, strong) UIScrollView *scrollView;

@end




@implementation DMImageBrowserCollectionViewCell

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


#pragma mark-
#pragma mark- Private Methods

- (void)resizeSubViews:(UIImage *)image {
    CGFloat contentHeight = ([UIScreen mainScreen].bounds.size.width*(image.size.height/image.size.width));
    if (contentHeight>=[UIScreen mainScreen].bounds.size.height) {
        _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, contentHeight);
        [_contentImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(_scrollView);
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
            make.height.mas_equalTo(contentHeight);
        }];
    }else{
        _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        [_contentImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(contentHeight);
        }];
    }
}


#pragma mark-
#pragma mark- Getters && Setters

- (UIImageView *)contentImageView {
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc] init];
        
    }
    return _contentImageView;
}

- (void)setAssetModel:(DMAssetModel *)assetModel {
    _assetModel = assetModel;
    
    [[DMPhotoManager sharePhotoManager] getPhotoWithAsset:assetModel.asset completion:^(UIImage *photo, NSDictionary *info, BOOL isDegraded) {
        
        self.contentImageView.image = photo;
        [self resizeSubViews:photo];
        
        
//        [self resizeSubviews];
//        _progressView.hidden = YES;
//        if (self.imageProgressUpdateBlock) {
//            self.imageProgressUpdateBlock(1);
//        }
    } progressHandler:^(double progress, NSError *error, BOOL *stop, NSDictionary *info) {
//        _progressView.hidden = NO;
//        [self bringSubviewToFront:_progressView];
//        progress = progress > 0.02 ? progress : 0.02;;
//        _progressView.progress = progress;
//        if (self.imageProgressUpdateBlock) {
//            self.imageProgressUpdateBlock(progress);
//        }
    } networkAccessAllowed:YES];
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsVerticalScrollIndicator = YES;
        
    }
    return _scrollView;
}

#pragma mark-
#pragma mark- SetupConstraints

- (void)setupSubviewsContraints{
    [self.contentView addSubview:self.scrollView];
    [self.scrollView addSubview:self.contentImageView];
    self.contentView.backgroundColor = [UIColor blackColor];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(10);
        make.right.mas_equalTo(self.contentView).mas_offset(-10);
        make.top.bottom.mas_equalTo(self);
    }];
    [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(_scrollView);
        make.height.mas_equalTo([UIScreen mainScreen].bounds.size.height);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
    }];
}








@end
