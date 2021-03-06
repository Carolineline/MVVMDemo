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
        RAC(_studentNameLabel, text) = RACObserve(self, model.name);
    }
    return _studentNameLabel;
}

- (UILabel *)studentAgeLabel{
    if (!_studentAgeLabel) {
        _studentAgeLabel = [[UILabel alloc] init];
        _studentAgeLabel.frame = CGRectMake(150, 20, 100, 20);
        _studentAgeLabel.font = [UIFont systemFontOfSize:17];
        _studentAgeLabel.textColor = [UIColor lightGrayColor];
        RAC(_studentAgeLabel, text) = RACObserve(self, model.age);
    }
    return _studentAgeLabel;
}

- (UIButton *)selectedButton{
    if (!_selectedButton) {
        _selectedButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectedButton.frame  = CGRectMake(20, 100, 60, 30);
        [_selectedButton setTitle:@"选中" forState:UIControlStateNormal];
        [_selectedButton setBackgroundColor:[UIColor redColor]];
//        [_selectedButton addTarget:self action:@selector
//         (didSelectedButtonAction) forControlEvents
//                                  :UIControlEventTouchUpInside];
        @weakify(self);
        _selectedButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self);
            [self didSelectedButtonAction];
            return [RACSignal empty];
            
        }];
        
    }
    return _selectedButton;
}
- (void)didSelectedButtonAction{
    self.contentView.backgroundColor =
    [UIColor colorWithRed:random()%256/255.0
                    green:random()%256/255.0
                     blue:random()%256/255.0
                    alpha:1];

}


//- (void)setModel:(MVVMModel *)model{
//    if (model) {
//        _model = model;
//        self.studentNameLabel.text = model.name;
//        self.studentAgeLabel.text = model.age;
//    }
//    
//    
//}

@end
