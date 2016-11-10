//
//  MVVMTableViewDelegate.h
//  MVVMDemo
//
//  Created by 晓琳 on 16/11/7.
//  Copyright © 2016年 晓琳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static NSString *const MVVMTableViewCellIdetifer = @"MVVMTableViewCellIdetifer";

@interface MVVMTableViewDelegate : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *dataSource;

@end

