//
//  ZPDFPageController.h
//  pdfReader
//
//  Created by XuJackie on 15/6/6.
//  Copyright (c) 2015年 peter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZPDFPageController : UIViewController
// CGPDFDocumentRef pdfDocument;
@property (assign, nonatomic) CGPDFDocumentRef pdfDocument;
@property (assign, nonatomic) long pageNO;

@end
