//
//  DMAlbumModel.m
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/7.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "DMAlbumModel.h"

@implementation DMAlbumModel


- (NSArray<DMAssetModel *> *)assetModels {
    if (!_assetModels) {
        _assetModels = [NSArray array];
    }
    return _assetModels;
}

- (NSMutableArray<DMAssetModel *> *)selectedModels {
    if (!_selectedModels) {
        _selectedModels = [NSMutableArray array];
    }
    return _selectedModels;
}


@end
