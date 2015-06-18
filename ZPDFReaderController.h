//
//  ZPDFReaderController.h
//  pdfReader
//
//  Created by XuJackie on 15/6/6.
//  Copyright (c) 2015年 peter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZPDFPageModel.h"

@interface ZPDFReaderController : UIViewController
{
     UIPageViewController *pageViewCtrl;
     ZPDFPageModel *pdfPageModel;
}
@property(nonatomic,copy)NSString *titleText, *fileName;
@end
