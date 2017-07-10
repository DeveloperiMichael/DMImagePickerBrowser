//
//  DMAssetModel.h
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/6.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum : NSUInteger {
    DMAssetModelMediaTypePhoto = 0,
    DMAssetModelMediaTypeLivePhoto,
    DMAssetModelMediaTypePhotoGif,
    DMAssetModelMediaTypeVideo,
    DMAssetModelMediaTypeAudio
} DMAssetModelMediaType;

@interface DMAssetModel : NSObject

@property (nonatomic, strong) id asset;             ///< PHAsset or ALAsset
@property (nonatomic, assign) BOOL isSelected;      ///< The select status of a photo, default is No
@property (nonatomic, assign) DMAssetModelMediaType type;
@property (nonatomic, copy) NSString *timeLength;


/// Init a photo dataModel With a asset
/// 用一个PHAsset/ALAsset实例，初始化一个照片模型
+ (instancetype)modelWithAsset:(id)asset type:(DMAssetModelMediaType)type;
+ (instancetype)modelWithAsset:(id)asset type:(DMAssetModelMediaType)type timeLength:(NSString *)timeLength;

@end
