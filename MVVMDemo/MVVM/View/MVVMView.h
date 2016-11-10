//
//  MVVMView.h
//  MVVMDemo
//
//  Created by 晓琳 on 16/11/7.
//  Copyright © 2016年 晓琳. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MVVMTableViewDelegate;
@interface MVVMView : UIView
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) MVVMTableViewDelegate *listTableViewDelegateModel;

@end
