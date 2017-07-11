//
//  DMImagePickerViewController.m
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/6.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "DMImagePickerViewController.h"
#import "DMImageBrowserViewController.h"
#import "DMImagePickerView.h"
#import "DMPhotoManager.h"
@interface DMImagePickerViewController ()<DMImagePickerViewDelegate>

@property (nonatomic, strong) DMImagePickerView *imagePickerView;

@property (nonatomic, strong) NSMutableArray *assetModelArray;

@end

@implementation DMImagePickerViewController

#pragma mark-
#pragma mark- View Life Cycle

- (instancetype)init {
    self = [super init];
    if (self) {
       
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    
    if (self.albumModel) {
        if (self.albumModel.assetModels.count<=0) {
            [self getAssetModelArray];
        }
    }else{
        [self getAblumModel];
    }
    
    [self setupSubviewsContraints];
}


#pragma mark-
#pragma mark- Request




#pragma mark-
#pragma mark- Response



#pragma mark-
#pragma mark- SACardViewDataSource




#pragma mark-
#pragma mark- delegate




#pragma mark-
#pragma mark- Event response

- (void)backButtonClicked:(DMImagePickerView *)view {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)sureButtonClicked:(DMImagePickerView *)view {
    [_albumModel.selectedModels removeAllObjects];
    if (_albumModel.assetModels.count>0) {
        [_albumModel.assetModels enumerateObjectsUsingBlock:^(DMAssetModel * _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
            if (model.isSelected) {
                [_albumModel.selectedModels addObject:model];
            }
        }];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath collectionView:(UICollectionView *)collectionView {
    DMImageBrowserViewController *vc = [[DMImageBrowserViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark-
#pragma mark- Private Methods

- (void)getAssetModelArray {
    __weak typeof(self) weakSelf = self;
    [[DMPhotoManager sharePhotoManager] getAssetsFromFetchResult:_albumModel.result allowPickingVideo:YES allowPickingImage:YES completion:^(NSArray<DMAssetModel *> *models) {
        weakSelf.albumModel.assetModels = models;
    }];
}

- (void)getAblumModel {
    __weak typeof(self) weakSelf = self;
    [[DMPhotoManager sharePhotoManager] getCameraRollAlbum:YES allowPickingImage:YES completion:^(DMAlbumModel *model) {
        weakSelf.albumModel = model;
        [weakSelf getAssetModelArray];
    }];

}
#pragma mark-
#pragma mark- Getters && Setters

- (DMImagePickerView *)imagePickerView {
    if (!_imagePickerView) {
        _imagePickerView = [[DMImagePickerView alloc] initWithAssetModelArray:self.albumModel.assetModels];
        _imagePickerView.navTitle = _albumModel.albumName.length>0?_albumModel.albumName:@"";
        _imagePickerView.delegate = self;
    }
    return _imagePickerView;
}

- (NSMutableArray *)assetModelArray {
    if (!_assetModelArray) {
        _assetModelArray = [NSMutableArray array];
    }
    return _assetModelArray;
}

#pragma mark-
#pragma mark- SetupConstraints

- (void)setupSubviewsContraints{
    
    [self.view addSubview:self.imagePickerView];
    [_imagePickerView mas_makeConstraints:^(MASConstraintMaker *make) {
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





