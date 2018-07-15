//
//  SYFlatButton.m
//  SYFlatButton
//
//  Created by Sunnyyoung on 2016/11/17.
//  Copyright © 2016年 Sunnyyoung. All rights reserved.
//

#import "ArtButton.h"

@interface ArtButton () <CALayerDelegate>
@property (nonatomic, assign) BOOL mouseDown;
@end

@implementation ArtButton

#pragma mark - Lifecycle

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

+ (instancetype)imageButton {
    ArtButton *btn = [[ArtButton alloc] initWithFrame:NSMakeRect(0, 0, 55, 55)];
    
    return btn;
}

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        [self setup];
    }
    return self;
}

#pragma mark - Drawing method

- (void)drawRect:(NSRect)dirtyRect {
    // Do nothing
}

- (BOOL)layer:(CALayer *)layer shouldInheritContentsScale:(CGFloat)newScale fromWindow:(NSWindow *)window {
    return YES;
}

#pragma mark - Setup method

- (void)setup {
    // Setup layer
    self.wantsLayer = YES;
    self.layer.masksToBounds = YES;
    self.layer.delegate = self;
    self.layer.backgroundColor = [NSColor clearColor].CGColor;
    self.alphaValue = self.isEnabled ? 1.0 : 0.5;
}

- (void)setupBackgroundImageView {
    if (!self.backgroundImage) {
        self.backgroundImageView.hidden = YES;
        return;
    }
    self.backgroundImageView.frame = self.bounds;
    self.backgroundImageView.image = self.backgroundImage;
    [self addSubview:self.backgroundImageView];
}

- (void)updateBackgroundImageView {
    if (!self.isEnabled && self.backgroundImageDisable) {
        self.backgroundImageView.image = self.backgroundImageDisable;
        return;
    }
    
    if (self.backgroundImage) {
        if (self.artState == ArtButtonStateNormal) {
            if (self.backgroundImageSelected && self.selected) {
                self.backgroundImageView.image = self.backgroundImageSelected;
            }else{
                self.backgroundImageView.image = self.backgroundImage;
            }
        }else if (self.backgroundImageHighlight && self.artState == ArtButtonStateHighlight){
            self.backgroundImageView.image = self.backgroundImageHighlight;
        }
    }
}


#pragma mark - Event Response

- (NSView *)hitTest:(NSPoint)point {
    return self.isEnabled ? [super hitTest:point] : nil;
}

- (void)mouseDown:(NSEvent *)event {
    if (self.isEnabled) {
        self.mouseDown = YES;
        self.state = (self.state == NSOnState) ? NSOffState : NSOnState;
        self.artState = ArtButtonStateHighlight;
    }
}

- (void)mouseEntered:(NSEvent *)event {
    if (self.mouseDown) {
        self.state = (self.state == NSOnState) ? NSOffState : NSOnState;
    }
}

- (void)mouseExited:(NSEvent *)event {
    if (self.mouseDown) {
        self.mouseDown = NO;
        self.state = (self.state == NSOnState) ? NSOffState : NSOnState;
    }
}

- (void)mouseUp:(NSEvent *)event {
    if (self.mouseDown) {
        self.mouseDown = NO;
        self.artState = ArtButtonStateNormal;
        [NSApp sendAction:self.action to:self.target from:self];
    }
}

#pragma mark - Property method

- (void)setBackgroundImage:(NSImage *)image forState:(ArtButtonState)state {
    if (state == ArtButtonStateNormal) {
        self.backgroundImage = image;
    }else if (state == ArtButtonStateHighlight) {
        self.backgroundImageHighlight = image;
    }else if (state == ArtButtonStateSelected) {
        self.backgroundImageSelected = image;
    }else if (state == ArtButtonStateDisable) {
        self.backgroundImageDisable = image;
    }
}

- (void)setBackgroundImage:(NSImage *)backgroundImage {
    _backgroundImage = backgroundImage;
    [self setupBackgroundImageView];
}

- (void)setArtState:(ArtButtonState)artState {
    _artState = artState;
    [self updateBackgroundImageView];
}

- (void)setSelected:(BOOL)selected {
    _selected = selected;
    [self updateBackgroundImageView];
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    [self updateBackgroundImageView];

}

- (NSImageView *)backgroundImageView {
    if (_backgroundImageView == nil) {
        _backgroundImageView = [[NSImageView alloc] init];
    }
    return _backgroundImageView;
}
@end
