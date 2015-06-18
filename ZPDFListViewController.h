//
//  ZPDFListViewController.h
//  pdfReader
//
//  Created by XuJackie on 15/6/6.
//  Copyright (c) 2015年 peter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZPDFListViewController : UIViewController
{
    float view_width, view_height;
    NSArray *titleArray, *fileArray;
    UITableView *pdfTableView;
}
@end
