//
//  SYFlatButton.h
//  SYFlatButton
//
//  Created by Sunnyyoung on 2016/11/17.
//  Copyright © 2016年 Sunnyyoung. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>
#import <CoreGraphics/CoreGraphics.h>


typedef enum : NSUInteger {
    ArtButtonStateNormal,
    ArtButtonStateHighlight,
    ArtButtonStateSelected,
    ArtButtonStateDisable,

} ArtButtonState;

@interface ArtButton : NSButton
@property (nonatomic, assign) NSInteger artTag;
@property (nonatomic, assign) ArtButtonState artState;
@property (nonatomic, assign) ArtButtonState artLastState;
@property (nonatomic, assign) BOOL selected;

@property (nonatomic, strong) NSImage *backgroundImage;
@property (nonatomic, strong) NSImage *backgroundImageHighlight;
@property (nonatomic, strong) NSImage *backgroundImageSelected;
@property (nonatomic, strong) NSImage *backgroundImageDisable;
@property (nonatomic, strong) NSImageView *backgroundImageView;


+ (instancetype)imageButton;
- (void)setBackgroundImage:(NSImage *)image forState:(ArtButtonState)state;

@end
