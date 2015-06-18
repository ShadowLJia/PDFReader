//
//  ZPDFView.m
//  pdfReader
//
//  Created by XuJackie on 15/6/6.
//  Copyright (c) 2015年 peter. All rights reserved.
//

#import "ZPDFView.h"

@implementation ZPDFView

-(id)initWithFrame:(CGRect)frame atPage:(int)index withPDFDoc:(CGPDFDocumentRef) pdfDoc{
    self = [super initWithFrame:frame];
    pageNO = index;
    pdfDocument = pdfDoc;
    return self;
}

-(void)drawInContext:(CGContextRef)context atPageNo:(int)page_no{
    // PDF page drawing expects a Lower-Left coordinate system, so we flip the coordinate system
    // before we start drawing.
    CGContextTranslateCTM(context, 0.0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    int pageSum = CGPDFDocumentGetNumberOfPages(pdfDocument);
    NSLog(@"pageSum = %d", pageSum);
    if (pageNO == 0) {
        pageNO = 1;
    }
    CGPDFPageRef page = CGPDFDocumentGetPage(pdfDocument, pageNO);
    CGContextSaveGState(context);
    CGAffineTransform pdfTransform = CGPDFPageGetDrawingTransform(page, kCGPDFCropBox, self.bounds, 0, true);
    CGContextConcatCTM(context, pdfTransform);
    CGContextDrawPDFPage(context, page);
    CGContextRestoreGState(context);
}

- (void)drawRect:(CGRect)rect {
    [self drawInContext:UIGraphicsGetCurrentContext() atPageNo:pageNO];
}

@end
