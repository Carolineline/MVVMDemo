//
//  MenuButton.m
//  MVVMDemo
//
//  Created by 晓琳 on 16/11/18.
//  Copyright © 2016年 晓琳. All rights reserved.
//

#import "MenuButton.h"
#import "Masonry.h"

@interface MenuButton ()
@property (nonatomic, strong) UIView *backView;
@end

@implementation MenuButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backView];
        [self.backView addSubview:self.iconImageView];
        [self.backView addSubview:self.noteLabel];
        [self updateConstraints];
    }
    return self;
}


+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

-(void)updateConstraints{
    
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top).offset(16);
        make.height.equalTo(@(51.5));
        
    }];

    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.backView.mas_centerX);
        make.top.equalTo(self.backView.mas_top);
        
    }];
    
    [self.noteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.iconImageView.mas_centerX);
        make.bottom.equalTo(self.backView.mas_bottom).offset(0);
        
    }];
    
    [self.iconImageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.iconImageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    [self.noteLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.noteLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    
    [super updateConstraints];
}

-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor lightGrayColor];
        
    }
    return _backView;
}
-(UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
//        _iconImageView.backgroundColor = [UIColor redColor];
    }
    return _iconImageView;
}
-(UILabel *)noteLabel{
    if (!_noteLabel) {
        _noteLabel = [[UILabel alloc] init];
        
    }
    return _noteLabel;
}
@end
