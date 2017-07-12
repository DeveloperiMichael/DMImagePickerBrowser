//
//  DMImageBrowserViewController.m
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/11.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "DMImageBrowserViewController.h"
#import "DMImageBrowserCollectionViewCell.h"
#import "DMImageBrowserView.h"
#import "UIColor+SAKitExtend.h"
#import "UIFont+SAKitExtend.h"
#import <Masonry/Masonry.h>
@interface DMImageBrowserViewController ()<DMImageBrowserViewDelegate>

@property (nonatomic, strong) DMImageBrowserView *imageBrowserView;

@end

@implementation DMImageBrowserViewController

#pragma mark-
#pragma mark- View Life Cycle



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupSubviewsContraints];
    
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (_currentIndex) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_currentIndex inSection:0];
            [self.imageBrowserView.collection scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        }
    });
    
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //[TZImageManager manager].shouldFixOrientation = NO;
}


#pragma mark-
#pragma mark- Request




#pragma mark-
#pragma mark- Response



#pragma mark-
#pragma mark- SACardViewDataSource




#pragma mark-
#pragma mark- delegate

- (NSInteger)imageBrowserView_collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.assetModelArray.count;
}

- (UICollectionViewCell *)imageBrowserView_collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DMImageBrowserCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kImageCollectionViewCellIdentifier forIndexPath:indexPath];
    cell.assetModel = _assetModelArray[indexPath.row];
    return cell;
}

- (void)imageBrowserView_scrollViewDidScroll:(UIScrollView *)scrollView andCurrentIndex:(NSInteger)currentIndex {
    _currentIndex = currentIndex;
}


- (void)backButtonClicked:(DMImageBrowserView *)view {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)selectButtonClicked:(DMImageBrowserView *)view {
    
}

#pragma mark-
#pragma mark- Event response



#pragma mark-
#pragma mark- Private Methods




#pragma mark-
#pragma mark- Getters && Setters

- (DMImageBrowserView *)imageBrowserView {
    if (!_imageBrowserView) {
        _imageBrowserView = [[DMImageBrowserView alloc] init];
        _imageBrowserView.delegate = self;
    }
    return _imageBrowserView;
}

- (NSArray<DMAssetModel *> *)assetModelArray {
    if (!_assetModelArray) {
        _assetModelArray = [NSArray array];
    }
    return _assetModelArray;
}

#pragma mark-
#pragma mark- SetupConstraints

- (void)setupSubviewsContraints{
    [self.view addSubview:self.imageBrowserView];
    [_imageBrowserView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
