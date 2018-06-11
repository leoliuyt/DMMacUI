//
//  DMLoginInputView.h
//  DMMacUI
//
//  Created by lbq on 2018/6/11.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import <Cocoa/Cocoa.h>


typedef NS_ENUM(NSUInteger, EDMInputViewType) {
    EDMInputViewTypeText,//文本框
    EDMInputViewTypeNumberAndText,//区号选择+文本框
    EDMInputViewTypeSecureText,//密码
};
@interface DMLoginInputView : NSView

- (instancetype)initWithType:(EDMInputViewType)aType;
@property (nonatomic, strong) NSTextField *textField;
@property (nonatomic, assign) BOOL highlighted;

@end
