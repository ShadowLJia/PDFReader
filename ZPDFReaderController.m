//
//  ZPDFReaderController.m
//  pdfReader
//
//  Created by XuJackie on 15/6/6.
//  Copyright (c) 2015年 peter. All rights reserved.
//

#import "ZPDFReaderController.h"
#import "ZPDFPageController.h"

@interface ZPDFReaderController ()

@end

@implementation ZPDFReaderController
@synthesize titleText, fileName;
- (void) viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.titleText;
    //CFURLRef pdfURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), CFSTR("test.pdf"), NULL, NULL);
    CFURLRef pdfURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), (__bridge CFStringRef)self.fileName, NULL, NULL);
    CGPDFDocumentRef pdfDocument = CGPDFDocumentCreateWithURL((CFURLRef)pdfURL);
    CFRelease(pdfURL);
    pdfPageModel = [[ZPDFPageModel alloc] initWithPDFDocument:pdfDocument];
    
    NSDictionary *options = [NSDictionary dictionaryWithObject:
                             [NSNumber numberWithInteger: UIPageViewControllerSpineLocationMin]
                                                        forKey: UIPageViewControllerOptionSpineLocationKey];
    
    pageViewCtrl = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                                                   navigationOrientation:UIPageViewControllerNavigationOrientationVertical
                                                                 options:options];
    ZPDFPageController *initialViewController = [pdfPageModel viewControllerAtIndex:1];
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    [pageViewCtrl setDataSource:pdfPageModel];
    
    [pageViewCtrl setViewControllers:viewControllers
                           direction:UIPageViewControllerNavigationDirectionReverse
                            animated:NO
                          completion:^(BOOL f){}];
    [self addChildViewController:pageViewCtrl];
    [self.view addSubview:pageViewCtrl.view];
    [pageViewCtrl didMoveToParentViewController:self];
}

- (void) viewDidUnload {
    
    [super viewDidUnload];
}
- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
