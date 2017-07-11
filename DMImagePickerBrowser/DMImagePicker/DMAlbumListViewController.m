//
//  DMAlbnmListViewController.m
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/10.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "DMAlbumListViewController.h"
#import "DMImagePickerViewController.h"
#import "DMAlbumModel.h"
#import "DMPhotoManager.h"
#import <Masonry/Masonry.h>
@interface DMAlbumListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray<DMAlbumModel *> *albumModelArray;
@property (nonatomic, strong) UITableView *table;

@end

@implementation DMAlbumListViewController


#pragma mark-
#pragma mark- View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"相册列表";
    [self setupSubviewsContraints];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self getAblumModelArray];
        dispatch_async(dispatch_get_main_queue(), ^{
            [_table reloadData];
        });
    });
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}
 
#pragma mark-
#pragma mark- Request




#pragma mark-
#pragma mark- Response



#pragma mark-
#pragma mark- SACardViewDataSource




#pragma mark-
#pragma mark- delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.albumModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellidentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellidentifier];
    }
    DMAlbumModel *model = self.albumModelArray[indexPath.row];
    cell.textLabel.text = model.albumName;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DMImagePickerViewController *vc = [[DMImagePickerViewController alloc] init];
    vc.albumModel = self.albumModelArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark-
#pragma mark- Event response


#pragma mark-
#pragma mark- Private Methods

- (void)getAblumModelArray {
    __weak typeof(self) weakSelf = self;
    [[DMPhotoManager sharePhotoManager] getAllAlbums:YES allowPickingImage:YES completion:^(NSArray<DMAlbumModel *> *models) {
        weakSelf.albumModelArray = models;
    }];
}


#pragma mark-
#pragma mark- Getters && Setters

- (NSArray<DMAlbumModel *> *)albumModelArray {
    if (!_albumModelArray) {
        _albumModelArray = [NSArray array];
    }
    return _albumModelArray;
}

- (UITableView *)table {
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
    }
    return _table;
}

#pragma mark-
#pragma mark- SetupConstraints

- (void)setupSubviewsContraints{
    [self.view addSubview:self.table];
    [_table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
