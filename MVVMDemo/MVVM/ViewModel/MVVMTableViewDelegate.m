//
//  MVVMTableViewDelegate.m
//  MVVMDemo
//
//  Created by 晓琳 on 16/11/7.
//  Copyright © 2016年 晓琳. All rights reserved.
//

#import "MVVMTableViewDelegate.h"
#import "MVVMTableViewCell.h"
#import "MVVMModel.h"

@implementation MVVMTableViewDelegate



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath
                              :(NSIndexPath *)indexPath{
    MVVMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier
                               :MVVMTableViewCellIdetifer];
    if (!cell) {
        cell = [[MVVMTableViewCell alloc] initWithStyle
                :UITableViewCellStyleDefault reuseIdentifier
                :MVVMTableViewCellIdetifer];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.dataSource[indexPath.row];
    [[[cell.selectedButton.rac_command rac_willDeallocSignal] takeUntil:cell.rac_willDeallocSignal] subscribeNext:^(id x) {
        if (!x) {
            return;
        }
        cell.selectedButton.rac_command  = nil;

    }];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath
                 :(NSIndexPath *)indexPath{
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath
                    :(NSIndexPath *)indexPath{
    return 150;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection
                      :(NSInteger)section{
    return self.dataSource.count;
}
@end
