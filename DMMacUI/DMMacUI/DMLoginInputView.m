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
@property (nonatomic, assign) EDMInputViewType type;
@property (nonatomic, strong) NSButton *mobileBtn;
@end
@implementation DMLoginInputView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    NSLog(@"%s",__func__);
    // Drawing code here.
}

- (instancetype)initWithType:(EDMInputViewType)aType
{
    self = [super init];
    self.type = aType;
    [self makeUI];
    return self;
}
//- (instancetype)initWithFrame:(NSRect)frameRect
//{
//    self = [super initWithFrame:frameRect];
//
//    return self;
//}

- (void)makeUI
{
    self.wantsLayer = YES;
    self.layer.backgroundColor =  [NSColor whiteColor].CGColor;
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 4;
    self.highlighted = NO;
    
    if (self.type == EDMInputViewTypeText) {
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self);
            make.left.equalTo(self).offset(5.);
            make.right.equalTo(self).offset(-5.);
        }];
    } else {
        [self.mobileBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self);
        }];
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self);
            make.left.equalTo(self.mobileBtn.mas_right).offset(5.);
            make.right.equalTo(self).offset(-5.);
        }];
    }
}

- (void)setHighlighted:(BOOL)highlighted
{
    _highlighted = highlighted;
    //FF3300
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

- (NSButton *)mobileBtn
{
    if(!_mobileBtn){
        _mobileBtn = [[NSButton alloc] init];
//        _mobileBtn setButtonType:<#(NSButtonType)#>
        [_mobileBtn setBezelStyle:NSBezelStyleTexturedRounded];
        _mobileBtn.title = @"+86";
        _mobileBtn.image = [NSImage imageNamed:@"login_arrow_down"];
        _mobileBtn.imagePosition = NSImageRight;
         _mobileBtn.bordered = NO;
        _mobileBtn.wantsLayer = YES;
        _mobileBtn.layer.backgroundColor = [NSColor clearColor].CGColor;
        [self addSubview:_mobileBtn];
    }
    return _mobileBtn;
}

@end
