//
//  ArtButtonCell.m
//  ArtVideoWBMac
//
//  Created by lbq on 2018/6/19.
//  Copyright © 2018年 yiqi. All rights reserved.
//

#import "ArtButtonCell.h"

@implementation ArtButtonCell

- (NSRect)drawTitle:(NSAttributedString *)title withFrame:(NSRect)frame inView:(NSView *)controlView
{
    if (![self isEnabled]) {
        return [super drawTitle:[self attributedTitle] withFrame:frame inView:controlView];
    }
    
    return [super drawTitle:title withFrame:frame inView:controlView];
}

@end
