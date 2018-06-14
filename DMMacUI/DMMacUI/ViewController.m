//
//  ViewController.m
//  DMMacUI
//
//  Created by lbq on 2018/6/11.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>

#import "DMLoginInputView.h"
#import "DMNewPopWindowController.h"
#import "DMPopWindowController.h"
#import "AppDelegate.h"

@interface ViewController()

@property (nonatomic, strong) NSTextField *textField;
@property (nonatomic, strong) DMLoginInputView *inputView;
@property (nonatomic, strong) DMLoginInputView *checkCode;
@property (nonatomic, strong) DMLoginInputView *password;

//@property (nonatomic, strong) DMNewPopWindowController *popWindowCtrl;
@property (nonatomic, strong) DMPopWindowController *popWindowCtrl;

@property (nonatomic, strong) NSButton *button;

@property (nonatomic, strong) NSWindow *rootWindow;
@property (nonatomic, strong) id eventMonitor;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self makeUI];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)makeUI
{
    [self.inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@310.);
        make.height.equalTo(@44.);
        make.center.equalTo(self.view);
    }];
    
    
    [self.checkCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@310.);
        make.height.equalTo(@44.);
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(60.);
    }];
    
    [self.password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@310.);
        make.height.equalTo(@44.);
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-60.);
    }];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(50);
        make.right.equalTo(self.view).offset(-50);
        make.top.equalTo(self.view).offset(10.);
        make.height.equalTo(@50.);
    }];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.inputView.highlighted = YES;
//    });
    
    self.button.target = self;
    self.button.action = @selector(popAction:);
}

- (void)popAction:(NSButton *)aBtn
{
    if (!self.popWindowCtrl)
    {
//        self.popWindowCtrl = [[DMNewPopWindowController alloc] initWithWindowNibName:@"DMNewPopWindowController"];
        self.popWindowCtrl = [[DMPopWindowController alloc] init];
//        self.popWindowCtrl.delegate = self;
        self.popWindowCtrl.windowWidth = self.button.frame.size.width;
    }
    
    [self showMenuWindow];
    
   self.eventMonitor = [NSEvent addLocalMonitorForEventsMatchingMask:NSEventMaskLeftMouseDown handler:^NSEvent * _Nullable(NSEvent * _Nonnull event) {
        NSLog(@"%tu==%@",event.type,event);
        [self.popWindowCtrl closeWindow];
       [NSEvent removeMonitor:self.eventMonitor];
        return event;
    }];
}

- (void)showMenuWindow
{
    
    [self popUpMenuWindowBehindSearchField];
    //必须remove后再add，否则close childWindow再打开childWindow，移动父窗口，子窗口不会跟着一起移动
    [self.rootWindow removeChildWindow:self.popWindowCtrl.window];
    [self.rootWindow addChildWindow:self.popWindowCtrl.window ordered:NSWindowAbove];
}

- (void)popUpMenuWindowBehindSearchField
{
    [self.popWindowCtrl popUpContextMenuAtPoint:NSMakePoint(self.rootWindow.frame.origin.x + self.button.frame.origin.x, self.rootWindow.frame.origin.y + self.button.frame.origin.y -2)];
}

- (DMLoginInputView *)inputView
{
    if(!_inputView){
        _inputView = [[DMLoginInputView alloc] initWithType:EDMInputViewTypeNumberAndText];
        [self.view addSubview:_inputView];
    }
    return _inputView;
}

- (DMLoginInputView *)checkCode
{
    if(!_checkCode){
        _checkCode = [[DMLoginInputView alloc] initWithType:EDMInputViewTypeText];
        [self.view addSubview:_checkCode];
    }
    return _checkCode;
}

- (DMLoginInputView *)password
{
    if(!_password){
        _password = [[DMLoginInputView alloc] initWithType:EDMInputViewTypeSecureText];
        [self.view addSubview:_password];
    }
    return _password;
}

- (NSButton *)button
{
    if(!_button){
        _button = [[NSButton alloc] init];
        _button.title = @"pop";
        [self.view addSubview:_button];
    }
    return _button;
}

- (NSWindow *)rootWindow
{
//    AppDelegate *appDelegate = (AppDelegate *)[NSApplication sharedApplication].delegate;
//    return appDelegate.window;
    return self.view.window;
}
@end
