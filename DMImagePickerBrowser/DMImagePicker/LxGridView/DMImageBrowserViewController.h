//
//  DMImageBrowserViewController.h
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/11.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMAssetModel.h"
@interface DMImageBrowserViewController : UIViewController


@property (nonatomic, strong) NSArray<DMAssetModel *> *assetModelArray;

@property (nonatomic, assign) NSInteger currentIndex;

@end
