//
//  ZPDFListViewController.m
//  pdfReader
//
//  Created by XuJackie on 15/6/6.
//  Copyright (c) 2015年 peter. All rights reserved.
//

#import "ZPDFListViewController.h"
#import "ZPDFReaderController.h"

@interface ZPDFListViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ZPDFListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    view_width = self.view.frame.size.width;
    view_height = self.view.frame.size.height;
    NSLog(@"self.view.frame = %@",NSStringFromCGRect(self.view.frame));
    titleArray = @[@"iOS 开发笔记——PDF的显示和浏览",@"Objective-C和CoreFoundation对象相互转换的内存管理总结",@"HTML5从入门到精通"];
    fileArray = @[@"001.pdf", @"002.pdf",  @"003.pdf"];
    CGRect frame = CGRectMake(10, 64, view_width-20, view_height-100);
    pdfTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    pdfTableView.dataSource = self;
    pdfTableView.delegate = self;
    pdfTableView.tableHeaderView = [[UIView alloc] init];
    pdfTableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:pdfTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return titleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"pdfTableView_cell";
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    NSString *titleText = [titleArray objectAtIndex:indexPath.row];
    cell.textLabel.text = titleText;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"didSelectRowAtIndexPath >>>> ");
    
    ZPDFReaderController *targetViewCtrl = [[ZPDFReaderController alloc] init];
    targetViewCtrl.hidesBottomBarWhenPushed = YES;//从第一个页面跳到第二个页面时隐藏tabBar的设置方法
    targetViewCtrl.titleText = [titleArray objectAtIndex:indexPath.row];
    targetViewCtrl.fileName =  [fileArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:targetViewCtrl animated:YES];
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
