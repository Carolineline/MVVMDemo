//
//  RootViewController.m
//  MVVMDemo
//
//  Created by 晓琳 on 16/11/7.
//  Copyright © 2016年 晓琳. All rights reserved.
//

#import "RootViewController.h"
#import "MVVMViewController.h"
#import "MasonryViewController.h"
static NSString *const rootViewControllerCellIdetifer = @"rootCellIdentifer";

@interface RootViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation RootViewController

#pragma mark - Life cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame
                      :CGRectMake(0, 0, self.view.bounds.size.width,
                                  self.view.bounds.size.height) style
                      :UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}

#pragma mark - TableView delegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath
                  :(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        MVVMViewController *mvvmViewController = [[MVVMViewController alloc] init];
        [self.navigationController pushViewController:mvvmViewController animated
                                                     :YES];
    }else{
        MasonryViewController *masonryViewController = [[MasonryViewController alloc] init];
        [self.navigationController pushViewController:masonryViewController animated
                                                     :YES];
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath
                              :(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier
                             :rootViewControllerCellIdetifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle
                :UITableViewCellStyleSubtitle reuseIdentifier
                :rootViewControllerCellIdetifer];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"MVVM_ReactiveCocoa";

    }else if(indexPath.row == 1){
        cell.textLabel.text = @"Masonry";

    }else{
        cell.textLabel.text = @"请点击进入";

    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath
                    :(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection
                      :(NSInteger)section{
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
