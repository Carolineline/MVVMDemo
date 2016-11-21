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
        [self updatesubViewConstraints];
    }
    return self;
}




-(void)updatesubViewConstraints{
    
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
        
    }];

    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.backView);
        make.width.height.equalTo(@(32));
        make.top.equalTo(self.backView.mas_top).offset(0);
        
        
    }];
    
    [self.noteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.iconImageView.mas_centerX);
        make.top.equalTo(self.iconImageView.mas_bottom).offset(4.5);
        make.bottom.equalTo(self.backView);
        
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
//        _backView.backgroundColor = [UIColor lightGrayColor];
        
    }
    return _backView;
}
-(UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
}
-(UILabel *)noteLabel{
    if (!_noteLabel) {
        _noteLabel = [[UILabel alloc] init];
        
    }
    return _noteLabel;
}


/**
    1.整个按钮由子视图撑开，即被包裹住的子视图觉得父视图
    2.因此backView 是由iamgeView和label的间隔，上下间距 和 抱紧的imageView的大小决定的宽度和长度所撑开
    3.若视图布局的时候没有限制约束优先级，而子视图的约束撑开了父视图的约束，则会发生约束冲突
 */
@end
