//
//  DMTVerticalCenterTextFieldCell.m
//  DMMacUI
//
//  Created by lbq on 2018/6/11.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "DMTVerticalCenterTextFieldCell.h"
@interface DMTVerticalCenterTextFieldCell()

@end
@implementation DMTVerticalCenterTextFieldCell

- (NSRect) titleRectForBounds:(NSRect)frame {
    
    CGFloat stringHeight = self.attributedStringValue.size.height;
    NSRect titleRect = [super titleRectForBounds:frame];
    CGFloat oldOriginY = frame.origin.y;
    titleRect.origin.y = oldOriginY + (frame.size.height - stringHeight) / 2.0;
    titleRect.size.height = titleRect.size.height - (titleRect.origin.y -   oldOriginY);
    return titleRect;
}

- (void) drawInteriorWithFrame:(NSRect)cFrame inView:(NSView*)cView {
    [super drawInteriorWithFrame:[self titleRectForBounds:cFrame] inView:cView];
}

- (void)selectWithFrame:(NSRect)rect inView:(NSView *)controlView editor:(NSText *)textObj delegate:(id)delegate start:(NSInteger)selStart length:(NSInteger)selLength {
    rect = [self titleRectForBounds:rect];
    [super selectWithFrame:rect inView:controlView editor:textObj delegate:delegate start:selStart length:selLength];
}

- (void)editWithFrame:(NSRect)aRect inView:(NSView *)controlView editor:(NSText *)textObj delegate:(id)anObject event:(NSEvent *)theEvent
{
    aRect = [self titleRectForBounds:aRect];
    [super editWithFrame:aRect inView:controlView editor:textObj delegate:anObject event:theEvent];
}
@end
