//
//  MVVMTableViewCell.h
//  MVVMDemo
//
//  Created by 晓琳 on 16/11/7.
//  Copyright © 2016年 晓琳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReactiveCocoa.h"

@class MVVMViewModel;
@class MVVMModel;

@interface MVVMTableViewCell : UITableViewCell
@property (strong, nonatomic) UILabel *studentNameLabel;
@property (strong, nonatomic) UILabel *studentAgeLabel;
@property (strong, nonatomic) UIButton *selectedButton;
@property (strong, nonatomic) MVVMModel *model;

@end
