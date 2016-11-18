//
//  MVVMViewModel.h
//  MVVMDemo
//
//  Created by 晓琳 on 16/11/7.
//  Copyright © 2016年 晓琳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveCocoa.h"
@interface MVVMViewModel : NSObject
@property (strong, nonatomic) NSMutableArray *dataArray;

- (RACSignal *)configMVVMModelDataSignal;

@end
