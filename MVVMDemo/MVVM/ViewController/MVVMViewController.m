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
#import "ReactiveCocoa.h"

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

    //获取数据（一般要先绑定数据源，再请求数据）
    [self bindData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 绑定数据
- (void) bindData{

    /**
     方法一：
     @weakify(self);
     [RACObserve(self.mvvmViewModel, dataArray) subscribeNext:^(NSMutableArray *array) {
     if(!array){
     return ;
     }
     @strongify(self);
     self.listTableViewDelegateModel.dataSource = array;
     NSLog(@"data = %@",array);
     [self.listTableView reloadData];
     
     }];
     */
    
    //方法二
    @weakify(self);
    RACSignal *dataSignal = [self.mvvmViewModel configMVVMModelDataSignal];
    [dataSignal subscribeNext:^(NSMutableArray *dataArray) {
        if(!dataArray){
            return ;
        }
        @strongify(self);
        self.listTableViewDelegateModel.dataSource = dataArray;
        [self.listTableView reloadData];
    }];
    
   
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
        
    }
    return _dataArray;
}
#pragma mark - note

/**
    对于ViewModel实际上是对model数据的处理：将model显示的数据转换为view可以显示的数据
 
    对于封装view:要权衡这个view的复杂度，对controlelr冗余的影响
 
    使用getter方法：懒加载，自定义该对象的属性，增强易读性
 */


/**
    RAC监听数据
    方法1.利用KVO,RACObserve(self.mvvmViewModel, dataArray)
    方法2.根据暴露的信号，订阅信号，接收返回的数据
 */
@end
