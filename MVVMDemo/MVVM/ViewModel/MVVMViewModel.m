//
//  MVVMViewModel.m
//  MVVMDemo
//
//  Created by 晓琳 on 16/11/7.
//  Copyright © 2016年 晓琳. All rights reserved.
//

#import "MVVMViewModel.h"

#import "MVVMModel.h"


@interface MVVMViewModel ()


@end
@implementation MVVMViewModel



- (RACSignal *)configMVVMModelDataSignal{
    //创建信号
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSMutableArray *tempArray = [NSMutableArray array];
        NSArray *array = @[@{@"name":@"小明", @"age":@"19"}, @{@"name":@"李阳", @"age":@"23"}, @{@"name":@"王五", @"age":@"25"}, @{@"name":@"刘宇", @"age":@"19"}, @{@"name":@"谢华", @"age":@"29"}];
        
        for (NSDictionary *modelDic in array) {
            MVVMModel *model = [[MVVMModel alloc] init];
            [model setValuesForKeysWithDictionary:modelDic];
            [tempArray addObject:model];
        }
        self.dataArray = tempArray;
        //发送信号
        [subscriber sendNext:self.dataArray];
        return nil;
    }];
    
}




/**
 1.直接返回一个信号，暴露出来，在创建这个block里处理数据
 2.对面暴露的数据源，一般不要直接初始化，而是创建一个临时的array,再得到数据后赋给array
 3.不要在初始化init方法里获取数据，处理数据
 */
@end
