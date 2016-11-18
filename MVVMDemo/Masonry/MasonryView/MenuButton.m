//
//  MenuButton.m
//  MVVMDemo
//
//  Created by 晓琳 on 16/11/18.
//  Copyright © 2016年 晓琳. All rights reserved.
//

#import "MenuButton.h"
#import <UIKit/UIKit.h>

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
    if (!self) {
        
    }
    return self;
}


+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

-(void)updateConstraints{
    
}

-(UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.backgroundColor = [UIColor redColor];
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
