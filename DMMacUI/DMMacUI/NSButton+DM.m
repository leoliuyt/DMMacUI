//
//  NSButton+DM.m
//  DMMacUI
//
//  Created by lbq on 2018/6/19.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "NSButton+DM.h"
#import <objc/runtime.h>
#import "SwizzlingDefine.h"
#import "NSMutableAttributedString+LL.h"
#import "NSMutableDictionary+LL.h"
@interface NSButton ()
@property (nonatomic, strong,readonly) NSMutableDictionary<NSNumber *,NSMutableDictionary *> *stateDic;
@property (nonatomic, assign) EArtControlState currentState;

@end
@implementation NSButton (DM)

+ (void)load
{
    swizzling_exchangeMethod([self class], @selector(setEnabled:), @selector(swizzling_setEnabled:));
}

- (void)swizzling_setEnabled:(BOOL)aEnable
{
    [self swizzling_setEnabled:aEnable];
    [self displayContent];
}

- (void)displayContent
{
    NSLog(@"%s",__func__);
    EArtControlState state = self.currentState;
    NSDictionary *dic = [self.stateDic objectForKey:@(state)];
    NSString *title = [dic objectForKey:@"title"];
    NSColor *titleColor = [dic objectForKey:@"titleColor"];
    NSColor *bgColor = [dic objectForKey:@"backgroudColor"];
    if (title) {
        self.title = title;
    }
    if (titleColor) {
        NSMutableParagraphStyle*btnStyle = [[NSMutableParagraphStyle alloc]init];
        btnStyle.alignment=NSTextAlignmentCenter;
        NSMutableAttributedString *attributeStr = [NSMutableAttributedString ll_makeAttributeString:self.title attribute:^(NSMutableDictionary *attributes) {
            attributes.ll_font(self.font).ll_color(titleColor).ll_paragraphStyle(btnStyle);
        }];
        self.attributedTitle = [attributeStr copy];
    }
    
    if (bgColor) {
        self.layer.backgroundColor = bgColor.CGColor;
    }
}

- (void)setTitle:(NSString *)title forState:(EArtControlState)state
{
    NSMutableDictionary *dic = [self.stateDic objectForKey:@(state)];
    if (!dic) {
        dic = [NSMutableDictionary dictionary];
        [self.stateDic setObject:dic forKey:@(state)];
    }
    [dic setObject:title forKey:@"title"];
    [self displayContent];
}

- (void)setTitleColor:(NSColor *)color forState:(EArtControlState)state
{
    NSMutableDictionary *mDic = [self.stateDic objectForKey:@(state)];
    if (!mDic) {
        mDic = [NSMutableDictionary dictionary];
        [self.stateDic setObject:mDic forKey:@(state)];
    }
    [mDic setObject:color forKey:@"titleColor"];
    [self displayContent];
}

- (void)setBackgroudColor:(NSColor *)color forState:(EArtControlState)state
{
    NSMutableDictionary *mDic = [self.stateDic objectForKey:@(state)];
    if (!mDic) {
        mDic = [NSMutableDictionary dictionary];
        [self.stateDic setObject:[mDic copy] forKey:@(state)];
    }
    [mDic setObject:color forKey:@"backgroudColor"];
    [self displayContent];
}

- (NSMutableDictionary *)stateDic
{
    NSMutableDictionary *dic =objc_getAssociatedObject(self, @selector(stateDic));
    if (!dic) {
        dic = @{}.mutableCopy;
        objc_setAssociatedObject(self, @selector(stateDic), dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dic;
}

- (void)setSelected:(BOOL)selected
{
    objc_setAssociatedObject(self, @selector(selected), @(selected), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self displayContent];
}

- (BOOL)selected
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (EArtControlState)currentState
{
    if (self.enabled == NO) {
        return EArtControlStateDisabled;
    } else if(self.selected) {
        return EArtControlStateSelected;
    } else {
        return EArtControlStateNormal;
    }
}
@end
