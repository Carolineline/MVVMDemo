//
//  MasonryViewController.m
//  MVVMDemo
//
//  Created by 晓琳 on 16/11/18.
//  Copyright © 2016年 晓琳. All rights reserved.
//

#import "MasonryViewController.h"
#import "Masonry.h"
#import "MenuButton.h"

@interface MasonryViewController ()
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray *imageNameArray;
@property (nonatomic, strong) NSMutableArray *buttonsArray;
@property (strong, nonatomic) NSMutableArray *widthConstraints;
@property (strong, nonatomic) NSArray *xArray;

#define UIScreenWidth   [UIScreen mainScreen].bounds.size.width

@end

@implementation MasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageArray = @[@"Menu_Icon1",@"Menu_Icon2",@"Menu_Icon3",@"Menu_Icon4"];
    self.imageNameArray = @[@"附近玩乐",@"附近美食",@"锦囊",@"收藏目的地"];
    self.xArray = @[@(350/8),@(350* 3/8),@(350* 5/8),@(350* 7/8)];

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Masonry";
    
    [self.view addSubview:self.backView];
    [self updateSubViewConstraints];
    [self initButtonsView];
    
    
}


- (void) initButtonsView{
    self.buttonsArray = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
        MenuButton *button = [[MenuButton alloc] init];
        UIImage *image = [UIImage imageNamed:self.imageArray[i]];
        button.iconImageView.image = image;
        button.noteLabel.text = self.imageNameArray[i];
        [self.buttonsArray addObject:button];

        [self.backView addSubview:button];

    }
    
    
    __block UIView *spaceView = nil;
    __block UIView *lastView = nil;
    CGFloat width = UIScreenWidth/375 * 44.4;
    
    [_buttonsArray enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL * _Nonnull stop) {
            spaceView = [[UIView alloc] init];
            [self.backView addSubview:spaceView];
            [spaceView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.backView);
                make.left.equalTo(lastView ? lastView.mas_right : self.backView.mas_left);
                make.width.height.mas_equalTo(width);
                
            }];

        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.backView);
            make.left.equalTo(spaceView.mas_right);

        }];
       lastView = view;
    }];

}

/**
    要确定视图的x,y坐标
    利用创建中间变量spaceView，来获得view起始的left，保存lastView的坐标，改变spaceview的坐标即可
*/

- (void)updateSubViewConstraints{
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(12.5);
        make.top.equalTo(self.view.mas_top).offset(150);
        make.right.equalTo(self.view.mas_right).offset(-12.5);
        make.height.equalTo(@(90));
        
    }];
    [super updateViewConstraints];
}


-(UIView *)backView{
    
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor whiteColor];
        _backView.layer.cornerRadius = 5.0;
        _backView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _backView.layer.borderWidth = 1.0;
    }
    return _backView;
    
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
