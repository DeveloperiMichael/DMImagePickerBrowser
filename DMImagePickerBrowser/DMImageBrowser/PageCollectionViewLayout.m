//
//  PageCollectionViewLayout.m
//  SACardDemo
//
//  Created by 张炯 on 17/4/24.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "PageCollectionViewLayout.h"

@implementation PageCollectionViewLayout {
    CGFloat _viewWidth;
    CGFloat _itemWidth;
    NSInteger _cellCount;
}

- (void)prepareLayout {
    [super prepareLayout];
    if (self.visibleCount < 5) {
        self.visibleCount = 5;
    }
    
    self.innerTopSpace = 0;
    self.innerBottomSpace = 0;
    self.innerHorizontalSpace = 0;
    
    _cellCount = [self.collectionView numberOfItemsInSection:0];
    _viewWidth =  CGRectGetWidth(self.collectionView.frame);
    _itemWidth = CGRectGetWidth(self.collectionView.frame) - 2 * self.innerHorizontalSpace;
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake([self.collectionView numberOfItemsInSection:0] * _viewWidth, CGRectGetHeight(self.collectionView.frame));
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {

    NSMutableArray * array = [NSMutableArray array];
    for (int i = 0; i < _cellCount; i++) {
        UICollectionViewLayoutAttributes * attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [array addObject:attrs];
    }
    return  array;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size = CGSizeMake(_itemWidth, CGRectGetHeight(self.collectionView.bounds) - self.innerTopSpace - self.innerBottomSpace);
    CGFloat cX =  self.collectionView.contentOffset.x + _viewWidth / 2;
    CGFloat attributesX = _viewWidth * indexPath.item + _viewWidth / 2;
    //attributes.zIndex = -fabs(attributesX - cX);
    CGFloat delta = cX - attributesX;
    CGFloat ratio =  - delta / (_itemWidth * 2);
    CGFloat scale = 1 - ABS(delta) / (_itemWidth * 8.0) * cos(ratio * M_PI_4);
    //动画
    attributes.transform = CGAffineTransformMakeScale(scale, scale);
    attributes.center = CGPointMake(attributesX, CGRectGetHeight(self.collectionView.frame) / 2 + (self.innerTopSpace - self.innerBottomSpace)/2);
    return attributes;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    CGFloat index = roundf(proposedContentOffset.x / _viewWidth);
    //    NSLog(@"index: %f---proposedContentOffset.x===%f",index,proposedContentOffset.x);
    proposedContentOffset.x = _viewWidth * index + _viewWidth / 2 - _itemWidth / 2;
    return proposedContentOffset;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return !CGRectEqualToRect(newBounds, self.collectionView.bounds);
}

@end
