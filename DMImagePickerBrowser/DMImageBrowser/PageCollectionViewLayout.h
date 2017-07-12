//
//  PageCollectionViewLayout.h
//
//  Created by 张炯 on 17/4/24.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, assign) CGFloat innerHorizontalSpace;

@property (nonatomic, assign) CGFloat innerTopSpace;

@property (nonatomic, assign) CGFloat innerBottomSpace;

@property (nonatomic, assign) NSInteger visibleCount;

@end
