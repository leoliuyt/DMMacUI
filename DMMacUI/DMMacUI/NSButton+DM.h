//
//  NSButton+DM.h
//  DMMacUI
//
//  Created by lbq on 2018/6/19.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import <Cocoa/Cocoa.h>
typedef NS_ENUM(NSUInteger, EArtControlState) {
    EArtControlStateNormal,
    EArtControlStateDisabled,
    EArtControlStateSelected,
};
@interface NSButton (DM)

@property (nonatomic, assign) BOOL selected;

- (void)setTitle:(NSString *)title forState:(EArtControlState)state;
- (void)setTitleColor:(NSColor *)color forState:(EArtControlState)state;
- (void)setBackgroudColor:(NSColor *)color forState:(EArtControlState)state;

@end
