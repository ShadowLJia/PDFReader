//
//  ZPDFPageController.m
//  pdfReader
//
//  Created by XuJackie on 15/6/6.
//  Copyright (c) 2015年 peter. All rights reserved.
//

#import "ZPDFPageController.h"
#import "ZPDFView.h"

@interface ZPDFPageController ()

@end

@implementation ZPDFPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    ZPDFView *pdfView = [[ZPDFView alloc] initWithFrame:frame atPage:self.pageNO withPDFDoc:self.pdfDocument];
    pdfView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:pdfView];
    
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
