//
//  MVVMViewModel.m
//  MVVMDemo
//
//  Created by 晓琳 on 16/11/7.
//  Copyright © 2016年 晓琳. All rights reserved.
//

#import "MVVMViewModel.h"

#import "MVVMModel.h"

#import "ReactiveCocoa.h"

@interface MVVMViewModel ()

@property (strong, nonatomic) RACSignal *dataSignal;

@end
@implementation MVVMViewModel

- (instancetype)init{
    self = [super init];
    if (self) {
        [self configMVVMModel];
    }
    return self;
}

- (void)configMVVMModel{
    
    [[self.dataSignal deliverOn:[RACScheduler mainThreadScheduler]] subscribeNext:^(RACTuple *requestData) {
//        NSLog(@"resguest = %@",requestData);
//        NSDictionary *response;
//        if (requestData.count) {
//            response = requestData.first;
//        }
    }];

}

- (RACSignal *)dataSignal{
    if (!_dataSignal) {
        NSMutableArray *array = [self configData];
    }
    return _dataSignal;
}



- (NSMutableArray *) configData {
    self.dataArray = [NSMutableArray array];
    NSArray *array = @[@{@"name":@"小明", @"age":@"19"}, @{@"name":@"李阳", @"age":@"23"}, @{@"name":@"王五", @"age":@"25"}, @{@"name":@"刘宇", @"age":@"19"}, @{@"name":@"谢华", @"age":@"29"}];
    
    for (NSDictionary *modelDic in array) {
        MVVMModel *model = [[MVVMModel alloc] init];
        [model setValuesForKeysWithDictionary:modelDic];
        [self.dataArray addObject:model];
    }

    return self.dataArray;
}

@end
