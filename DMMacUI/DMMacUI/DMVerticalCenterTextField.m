//
//  DMVerticalCenterTextField.m
//  DMMacUI
//
//  Created by lbq on 2018/6/11.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "DMVerticalCenterTextField.h"
#import "DMVerticalCenterTextFieldCell.h"
@implementation DMVerticalCenterTextField

+ (Class)cellClass {
    //为了垂直居中
    return [DMVerticalCenterTextFieldCell class];
}

- (void)drawRect:(NSRect)dirtyRect {
    //成为第一响应者时，不显示背景框
    if (self.window.firstResponder == self.currentEditor && NSApp.active) {
        [NSGraphicsContext saveGraphicsState];
        NSSetFocusRingStyle(NSFocusRingOnly);
        [NSGraphicsContext restoreGraphicsState];
    } else {
        [super drawRect:dirtyRect];
    }
}
@end
