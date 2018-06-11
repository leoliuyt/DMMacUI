//
//  DMLoginInputView.h
//  DMMacUI
//
//  Created by lbq on 2018/6/11.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DMVerticalCenterTextField.h"

@interface DMLoginInputView : NSView

@property (nonatomic, strong) DMVerticalCenterTextField *textField;
@property (nonatomic, assign) BOOL highlighted;

@end
