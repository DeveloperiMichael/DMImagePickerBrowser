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

@end



