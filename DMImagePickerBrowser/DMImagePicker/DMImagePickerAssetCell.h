//
//  DMImagePickerCollectionViewCell.h
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/6.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "DMAssetModel.h"

typedef enum : NSUInteger {
    DMAssetCellTypePhoto = 0,
    DMAssetCellTypeLivePhoto,
    DMAssetCellTypePhotoGif,
    DMAssetCellTypeVideo,
    DMAssetCellTypeAudio,
} DMAssetCellType;

@interface DMImagePickerAssetCell : UICollectionViewCell

@property (nonatomic, strong) DMAssetModel *model;
@property (nonatomic, copy) NSString *representedAssetIdentifier;
@property (nonatomic, assign) PHImageRequestID imageRequestID;
@property (nonatomic, assign) DMAssetCellType type;
@property (nonatomic, assign) BOOL allowPickingGif;
@property (nonatomic, copy) void (^didSelectPhotoBlock)(BOOL);
@property (nonatomic, strong) UIButton *selectButton;

@end



