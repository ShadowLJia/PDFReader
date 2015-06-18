//
//  ZPDFPageModel.m
//  pdfReader
//
//  Created by XuJackie on 15/6/6.
//  Copyright (c) 2015年 peter. All rights reserved.
//

#import "ZPDFPageModel.h"
#import "ZPDFPageController.h"

@implementation ZPDFPageModel

-(id) initWithPDFDocument:(CGPDFDocumentRef) pdfDoc {
    self = [super init];
    if (self) {
        pdfDocument = pdfDoc;
    }
    return self;
}

- (ZPDFPageController *)viewControllerAtIndex:(NSUInteger)pageNO {
    // Return the data view controller for the given index.
    long pageSum = CGPDFDocumentGetNumberOfPages(pdfDocument);
    if (pageSum== 0 || pageNO >= pageSum+1) {
        return nil;
    }
    // Create a new view controller and pass suitable data.
    ZPDFPageController *pageController = [[ZPDFPageController alloc] init];
    pageController.pdfDocument = pdfDocument;
    pageController.pageNO  = pageNO;
    return pageController;
}

- (NSUInteger)indexOfViewController:(ZPDFPageController *)viewController {
    return viewController.pageNO;
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [self indexOfViewController: (ZPDFPageController *)viewController];
    if ((index == 1) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [self indexOfViewController: (ZPDFPageController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    long pageSum = CGPDFDocumentGetNumberOfPages(pdfDocument);
    if (index >= pageSum+1) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

@end
