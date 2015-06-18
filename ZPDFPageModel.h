//
//  ZPDFPageModel.h
//  pdfReader
//
//  Created by XuJackie on 15/6/6.
//  Copyright (c) 2015年 peter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIPageViewController.h>

@class ZPDFPageController;

@interface ZPDFPageModel : NSObject <UIPageViewControllerDataSource>
{
    CGPDFDocumentRef pdfDocument;
}
//@property (assign, nonatomic) CGPDFDocumentRef pdfDocument;
//@property (strong, nonatomic) NSArray *pageContent;
-(id) initWithPDFDocument:(CGPDFDocumentRef) pdfDocument;

- (ZPDFPageController *)viewControllerAtIndex:(NSUInteger)index;
- (NSUInteger)indexOfViewController:(ZPDFPageController *)viewController;
@end
