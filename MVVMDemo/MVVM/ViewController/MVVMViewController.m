//
//  MVVMViewController.m
//  MVVMDemo
//
//  Created by 晓琳 on 16/11/7.
//  Copyright © 2016年 晓琳. All rights reserved.
//

#import "MVVMViewController.h"
#import "MVVMView.h"
#import "MVVMViewModel.h"
#import "MVVMTableViewDelegate.h"
@interface MVVMViewController ()
@property (strong, nonatomic) MVVMViewModel *mvvmViewModel;
@property (strong, nonatomic) MVVMView *mvvmView;

@end

@implementation MVVMViewController
#pragma mark - life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"MVVM";
    //渲染视图
    [self.view addSubview:self.mvvmView];
    
    //获取数据
    NSMutableArray *array = [self.mvvmViewModel configMVVMModel];
    _mvvmView.listTableViewDelegateModel.dataSource = array;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - getter Method
- (MVVMView *)mvvmView{
    if (!_mvvmView) {
        _mvvmView = [[MVVMView alloc] initWithFrame
                     :CGRectMake(0, 0, self.view.bounds.size.width,
                                 self.view.bounds.size.height)];
    }
    return _mvvmView;
}
- (MVVMViewModel *)mvvmViewModel{
    if (!_mvvmViewModel) {
        _mvvmViewModel = [[MVVMViewModel alloc] init];
    }
    return _mvvmViewModel;
}

@end
