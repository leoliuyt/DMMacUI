//
//  DMLoginInputView.m
//  DMMacUI
//
//  Created by lbq on 2018/6/11.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "DMLoginInputView.h"
#import <Masonry/Masonry.h>
@interface DMLoginInputView()

@end
@implementation DMLoginInputView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    NSLog(@"%s",__func__);
    // Drawing code here.
}

- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    [self makeUI];
    return self;
}

- (void)makeUI
{
    self.wantsLayer = YES;
    self.layer.backgroundColor =  [NSColor whiteColor].CGColor;
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 4;
    self.highlighted = NO;
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self).offset(5.);
        make.right.equalTo(self).offset(-5.);
    }];
}

- (void)setHighlighted:(BOOL)highlighted
{
    _highlighted = highlighted;
    self.layer.borderColor = _highlighted ? [NSColor redColor].CGColor : [NSColor whiteColor].CGColor;
}

- (DMVerticalCenterTextField *)textField
{
    if(!_textField){
        _textField = [[DMVerticalCenterTextField alloc] initWithFrame:CGRectZero];
        _textField.drawsBackground = NO;
        _textField.bordered = NO;
        _textField.placeholderString = @"请输入手机号";
        [self addSubview:_textField];
    }
    return _textField;
}

@end
