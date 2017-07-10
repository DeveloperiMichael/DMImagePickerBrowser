//
//  DMPhotoManager.h
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/7.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "DMAssetModel.h"
#import "DMAlbumModel.h"

#define iOS7Later ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f)
#define iOS8Later ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
#define iOS9Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)

@interface DMPhotoManager : NSObject

+ (instancetype)sharePhotoManager;

@property (nonatomic, strong) PHCachingImageManager *cachingImageManager;

/** 不能选择的照片是否隐藏 */
@property (nonatomic, assign) BOOL hideWhenCanNotSelect;

/** 是否修正账片 默认修正 */
@property (nonatomic, assign) BOOL shouldFixOrientation;

/** 默认600像素宽 */
@property (nonatomic, assign) CGFloat photoPreviewMaxWidth;

/** 最小可选中的图片宽度，默认是0，小于这个宽度的图片不可选中 */ 
@property (nonatomic, assign) NSInteger minPhotoWidthSelectable;
@property (nonatomic, assign) NSInteger minPhotoHeightSelectable;

/** 对照片排序，按修改时间升序，默认是YES。如果设置为NO,最新的照片会显示在最前面，内部的拍照按钮会排在第一个 */
@property (nonatomic, assign) BOOL sortAscendingByModificationDate;

/** 默认4列, TZPhotoPickerController中的照片collectionView */ 
@property (nonatomic, assign) NSInteger columnNumber;

/** @return Return YES if Authorized 返回YES如果得到了授权 */
- (BOOL)authorizationStatusAuthorized;


/** @return 授权状态 */
- (NSInteger)authorizationStatus;


/** Get Album 获得相册/相册数组 */
- (void)getCameraRollAlbum:(BOOL)allowPickingVideo allowPickingImage:(BOOL)allowPickingImage completion:(void (^)(DMAlbumModel *model))completion;
- (void)getAllAlbums:(BOOL)allowPickingVideo allowPickingImage:(BOOL)allowPickingImage completion:(void (^)(NSArray<DMAlbumModel *> *models))completion;


/** Get Assets 获得Asset数组 */
- (void)getAssetsFromFetchResult:(id)result allowPickingVideo:(BOOL)allowPickingVideo allowPickingImage:(BOOL)allowPickingImage completion:(void (^)(NSArray<DMAssetModel *> *models))completion;
- (void)getAssetFromFetchResult:(id)result atIndex:(NSInteger)index allowPickingVideo:(BOOL)allowPickingVideo allowPickingImage:(BOOL)allowPickingImage completion:(void (^)(DMAssetModel *model))completion;
- (NSString *)getAssetIdentifier:(id)asset;

/** Get photo 获得照片 */
- (BOOL)isPhotoSelectableWithAsset:(id)asset;
- (void)getPostImageWithAlbumModel:(DMAlbumModel *)model completion:(void (^)(UIImage *postImage))completion;

- (PHImageRequestID)getPhotoWithAsset:(id)asset completion:(void (^)(UIImage *photo,NSDictionary *info,BOOL isDegraded))completion;
- (PHImageRequestID)getPhotoWithAsset:(id)asset photoWidth:(CGFloat)photoWidth completion:(void (^)(UIImage *photo,NSDictionary *info,BOOL isDegraded))completion;
- (PHImageRequestID)getPhotoWithAsset:(id)asset completion:(void (^)(UIImage *photo,NSDictionary *info,BOOL isDegraded))completion progressHandler:(void (^)(double progress, NSError *error, BOOL *stop, NSDictionary *info))progressHandler networkAccessAllowed:(BOOL)networkAccessAllowed;
- (PHImageRequestID)getPhotoWithAsset:(id)asset photoWidth:(CGFloat)photoWidth completion:(void (^)(UIImage *photo,NSDictionary *info,BOOL isDegraded))completion progressHandler:(void (^)(double progress, NSError *error, BOOL *stop, NSDictionary *info))progressHandler networkAccessAllowed:(BOOL)networkAccessAllowed;

/// Get full Image 获取原图
/// 该方法会先返回缩略图，再返回原图，如果info[PHImageResultIsDegradedKey] 为 YES，则表明当前返回的是缩略图，否则是原图。
- (void)getOriginalPhotoWithAsset:(id)asset completion:(void (^)(UIImage *photo,NSDictionary *info))completion;
- (void)getOriginalPhotoWithAsset:(id)asset newCompletion:(void (^)(UIImage *photo,NSDictionary *info,BOOL isDegraded))completion;
- (void)getOriginalPhotoDataWithAsset:(id)asset completion:(void (^)(NSData *data,NSDictionary *info,BOOL isDegraded))completion;
@end
