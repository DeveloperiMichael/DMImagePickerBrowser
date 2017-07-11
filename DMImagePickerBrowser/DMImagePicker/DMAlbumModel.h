//
//  DMAlbumModel.h
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/7.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMAssetModel.h"
@interface DMAlbumModel : NSObject

@property (nonatomic, copy) NSString *albumName;

@property (nonatomic, assign) NSInteger photoCount;

/** < PHFetchResult<PHAsset> or ALAssetsGroup<ALAsset> */
@property (nonatomic, strong) id result;

@property (nonatomic, strong) NSArray<DMAssetModel *> *assetModels;

@property (nonatomic, strong) NSMutableArray<DMAssetModel *> *selectedModels;

@property (nonatomic, assign) NSUInteger selectedCount;

@end
