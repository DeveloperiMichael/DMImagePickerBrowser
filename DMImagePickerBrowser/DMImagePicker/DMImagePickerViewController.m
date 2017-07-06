//
//  DMImagePickerViewController.m
//  DMImagePickerBrowser
//
//  Created by 张炯 on 2017/7/6.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "DMImagePickerViewController.h"
#import "DMImagePickerView.h"

@interface DMImagePickerViewController ()

@property (nonatomic, strong) DMImagePickerView *imagePickerView;



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



#pragma mark-
#pragma mark- Private Methods




#pragma mark-
#pragma mark- Getters && Setters

- (DMImagePickerView *)imagePickerView {
    if (!_imagePickerView) {
        _imagePickerView = [[DMImagePickerView alloc] init];
        _imagePickerView.navTitle = _fileName;
    }
    return _imagePickerView;
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





