//
//  MVVMView.m
//  MVVMDemo
//
//  Created by 晓琳 on 16/11/7.
//  Copyright © 2016年 晓琳. All rights reserved.
//

#import "MVVMView.h"
#import "MVVMTableViewDelegate.h"
@interface MVVMView ()
@property (strong, nonatomic) UITableView *listTableView;



@end

@implementation MVVMView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self ceateSubviews];
    }
    return self;
}

- (void)ceateSubviews{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.listTableView];
    [self.listTableView reloadData];
}
- (UITableView *)listTableView{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame
                          :CGRectMake(0, 0, self.bounds.size.width,
                                      self.bounds.size.height) style
                          :UITableViewStylePlain];
        _listTableView.delegate = self.listTableViewDelegateModel;
        _listTableView.dataSource = self.listTableViewDelegateModel;
        _listTableViewDelegateModel.dataSource = self.dataArray;
        
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


@end
