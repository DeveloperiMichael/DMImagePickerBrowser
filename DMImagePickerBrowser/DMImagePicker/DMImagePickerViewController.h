//
//  DMImagePickerViewController.h
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/6.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMAlbumModel.h"
@class DMImagePickerCollectionView;

@interface DMImagePickerViewController : UIViewController

@property (nonatomic, strong) DMAlbumModel  *albumModel;

@end
