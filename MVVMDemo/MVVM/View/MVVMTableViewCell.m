//
//  MVVMTableViewCell.m
//  MVVMDemo
//
//  Created by 晓琳 on 16/11/7.
//  Copyright © 2016年 晓琳. All rights reserved.
//

#import "MVVMTableViewCell.h"
#import "MVVMModel.h"
@implementation MVVMTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:
(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void) createSubviews{
    [self.contentView addSubview:self.studentNameLabel];
    [self.contentView addSubview:self.studentAgeLabel];
    [self.contentView addSubview:self.selectedButton];
}

- (UILabel *)studentNameLabel{
    if (!_studentNameLabel) {
        _studentNameLabel = [[UILabel alloc] init];
        _studentNameLabel.frame = CGRectMake(20, 20, 100, 20);
        _studentNameLabel.font = [UIFont systemFontOfSize:18.0];
        _studentNameLabel.textColor = [UIColor blueColor];
    }
    return _studentNameLabel;
}

- (UILabel *)studentAgeLabel{
    if (!_studentAgeLabel) {
        _studentAgeLabel = [[UILabel alloc] init];
        _studentAgeLabel.frame = CGRectMake(150, 20, 100, 20);
        _studentAgeLabel.font = [UIFont systemFontOfSize:17];
        _studentAgeLabel.textColor = [UIColor lightGrayColor];
    }
    return _studentAgeLabel;
}

- (UIButton *)selectedButton{
    if (!_selectedButton) {
        _selectedButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectedButton.frame  = CGRectMake(20, 100, 60, 30);
        [_selectedButton setTitle:@"选中" forState:UIControlStateNormal];
        [_selectedButton setBackgroundColor:[UIColor redColor]];
        [_selectedButton addTarget:self action:@selector
         (didSelectedButtonAction:) forControlEvents
                                  :UIControlEventTouchUpInside];
    }
    return _selectedButton;
}
- (void)didSelectedButtonAction:(UIButton *)button{
    self.contentView.backgroundColor =
    [UIColor colorWithRed:random()%256/255.0
                    green:random()%256/255.0
                     blue:random()%256/255.0
                    alpha:1];

}

- (void)setModel:(MVVMModel *)model{
    if (model) {
        _model = model;
        self.studentNameLabel.text = model.name;
        self.studentAgeLabel.text = model.age;
    }
}

#pragma mark - note

/**
    对于ViewModel实际上是对model数据的处理：将model显示的数据转换为view可以显示的数据
 
    对于封装view:要权衡这个view的复杂度，对controlelr冗余的影响
 
    使用getter方法：懒加载，自定义该对象的属性，增强易读性
 */
@end
