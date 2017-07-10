//
//  DMAssetModel.m
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/6.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "DMAssetModel.h"

@implementation DMAssetModel

+ (instancetype)modelWithAsset:(id)asset type:(DMAssetModelMediaType)type{
    DMAssetModel *model = [[DMAssetModel alloc] init];
    model.asset = asset;
    model.isSelected = NO;
    model.type = type;
    return model;
}

+ (instancetype)modelWithAsset:(id)asset type:(DMAssetModelMediaType)type timeLength:(NSString *)timeLength {
    DMAssetModel *model = [self modelWithAsset:asset type:type];
    model.timeLength = timeLength;
    return model;
}


@end
