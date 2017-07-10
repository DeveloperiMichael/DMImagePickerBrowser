//
//  DMImagePickerViewController.m
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/6.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "DMImagePickerViewController.h"
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
    
    if (self.albumModelArray.count>0) {
        [self getAssetModelArray];
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
    
}

#pragma mark-
#pragma mark- Private Methods

- (void)getAssetModelArray {
    __weak typeof(self) weakSelf = self;
    [self.albumModelArray enumerateObjectsUsingBlock:^(DMAlbumModel * _Nonnull albumModel, NSUInteger idx, BOOL * _Nonnull stop) {
        [[DMPhotoManager sharePhotoManager] getAssetsFromFetchResult:albumModel.result allowPickingVideo:YES allowPickingImage:YES completion:^(NSArray<DMAssetModel *> *models) {
            [weakSelf.assetModelArray addObjectsFromArray:models];
        }];
    }];
}



#pragma mark-
#pragma mark- Getters && Setters

- (DMImagePickerView *)imagePickerView {
    if (!_imagePickerView) {
        _imagePickerView = [[DMImagePickerView alloc] initWithAssetModelArray:self.assetModelArray];
        _imagePickerView.navTitle = _fileName;
        _imagePickerView.delegate = self;
    }
    return _imagePickerView;
}

- (NSArray *)albumModelArray {
    if (!_albumModelArray) {
        _albumModelArray = [NSArray array];
    }
    return _albumModelArray;
}

- (NSMutableArray *)assetModelArray {
    if (!_assetModelArray) {
        _assetModelArray = [NSMutableArray array];
    }
    return _assetModelArray;
}

- (void)setFileName:(NSString *)fileName {
    _fileName = fileName;
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





