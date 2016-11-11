//
//  MVVMViewController.m
//  MVVMDemo
//
//  Created by 晓琳 on 16/11/7.
//  Copyright © 2016年 晓琳. All rights reserved.
//

#import "MVVMViewController.h"
#import "MVVMViewModel.h"
#import "MVVMTableViewDelegate.h"
@interface MVVMViewController ()
@property (strong, nonatomic) MVVMViewModel *mvvmViewModel;
@property (strong, nonatomic) MVVMTableViewDelegate *listTableViewDelegateModel;

@property (strong, nonatomic) UITableView *listTableView;
@property (strong, nonatomic) NSMutableArray *dataArray;


@end

@implementation MVVMViewController
#pragma mark - life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"MVVM";
    //渲染视图
    [self.view addSubview:self.listTableView];

    //获取数据
    self.listTableViewDelegateModel.dataSource = self.dataArray;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - getter Method
- (MVVMViewModel *)mvvmViewModel{
    if (!_mvvmViewModel) {
        _mvvmViewModel = [[MVVMViewModel alloc] init];
    }
    return _mvvmViewModel;
}

- (UITableView *)listTableView{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame
                          :CGRectMake(0, 0, self.view.bounds.size.width,
                                      self.view.bounds.size.height) style
                          :UITableViewStylePlain];
        _listTableView.delegate = self.listTableViewDelegateModel;
        _listTableView.dataSource = self.listTableViewDelegateModel;
        
    }
    return _listTableView;
}

- (MVVMTableViewDelegate *)listTableViewDelegateModel{
    if (!_listTableViewDelegateModel) {
        _listTableViewDelegateModel = [[MVVMTableViewDelegate alloc] init];
    }
    return _listTableViewDelegateModel;
}
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        _dataArray = [self.mvvmViewModel configMVVMModel];

    }
    return _dataArray;
}


@end
